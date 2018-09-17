package me.imran.personalblog.login.controller;

import me.imran.personalblog.admin.model.User;
import me.imran.personalblog.admin.repository.UserRepository;
import me.imran.personalblog.login.model.ChangePassword;
import me.imran.personalblog.login.model.Login;
import me.imran.personalblog.login.model.LoginRole;
import me.imran.personalblog.login.repository.LoginRoleRepository;
import me.imran.personalblog.login.service.SecurityService;
import me.imran.personalblog.login.service.UserService;
import me.imran.personalblog.login.util.VerifyRecaptcha;
import me.imran.personalblog.login.validator.LoginValidator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.UUID;
/**
 * @author Imran Hossain
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private LoginValidator loginValidator;
    @Autowired
    UserRepository userRepository;
    @Autowired
    LoginRoleRepository loginRoleRepository;
    @Autowired
    MailSender mailSender;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    VerifyRecaptcha verifyRecaptcha;
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("loginForm", new Login());
        model.addAttribute("page","registration");
        return "login/index";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("loginForm") Login loginForm, @RequestParam(value = "g-recaptcha-response",required = false) String gCaptchaResponse, BindingResult result, Model model) {


        if( ! verifyRecaptcha.verify(gCaptchaResponse)){
            model.addAttribute("error","Invalid Captcha");
            model.addAttribute("loginForm", loginForm);
            model.addAttribute("page","registration");
            return "login/index";
        }

        loginValidator.validate(loginForm, result);

        if(result.hasErrors()){
            model.addAttribute("loginForm", loginForm);
            model.addAttribute("page","registration");
            return "login/index";
        }

        userService.save(loginForm);

        securityService.autologin(loginForm.getUsername(), loginForm.getPasswordConfirm());

        return "redirect:/admin/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String captcha, String logout, String message) {
        if (captcha != null)
            model.addAttribute("error", "Invalid Captcha!");
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");
        if (message != null)
            model.addAttribute("message", "You have successfully changed your password");
        model.addAttribute("loginForm",new Login());
        model.addAttribute("page","login");
        return "login/index";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.GET)
    public String doLoginGet() {


        return "redirect:/login?error";
    }


    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(@ModelAttribute("loginForm") Login loginForm, @RequestParam(value = "g-recaptcha-response",required = false) String gCaptchaResponse, BindingResult result, Model model) {


        if( ! verifyRecaptcha.verify(gCaptchaResponse)){
            return "redirect:/login?captcha";
        }

        loginValidator.validateLogin(loginForm, result);

        if(result.hasErrors()){
            return "redirect:/login?error";
        }

        securityService.autologin(loginForm.getUsername(), loginForm.getPassword());

        return "redirect:/welcome";
    }


    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String forgot(Model model, String error, String captcha, String success, String invalid) {
        if (captcha != null)
            model.addAttribute("error", "Invalid Captcha!");
        if(invalid!=null)
            model.addAttribute("error","Your passoord reset code is invalid or expired. You can request for new one.");
        if (error != null)
            model.addAttribute("error", "Your username is invalid.");

        if (success != null)
            model.addAttribute("message", "Password reset link has been sent successfully into your email.");
        model.addAttribute("loginForm", new Login());
        model.addAttribute("page","forgot");
        return "login/index";
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
    public String forgotPost(Model model,@ModelAttribute("loginForm") Login login,@RequestParam(value = "g-recaptcha-response",required = false) String gCaptchaResponse) {

        if( ! verifyRecaptcha.verify(gCaptchaResponse)){

            return "redirect:/forgot?captcha";
        }

        if(login.getUsername().trim().equals("") || userRepository.findByUsername(login.getUsername().trim())==null){
            return "redirect:/forgot?error";
        }

        User user = userRepository.findByUsername(login.getUsername().trim());
        user.setPasswordRecoveryCode(UUID.randomUUID().toString()+Long.toString(new Date().getTime()));
        userRepository.save(user);
        SimpleMailMessage message = new SimpleMailMessage();


        message.setFrom("cptu@ataur.me");
        message.setTo(user.getEmail());
        message.setBcc("ataur.me71@gmail.com");
        message.setSubject("Reset Password | CPTU");
        message.setText("Here is your password recovery code. Please click the following link to reset your password." +
                "<a href='http://cptu.ataur.me:3000/reset/"+user.getPasswordRecoveryCode()+"'>Click here</a>");
        mailSender.send(message);
        return "redirect:/forgot?success";

    }

    @RequestMapping(value = "/reset/{code}", method = RequestMethod.GET)
    public String reset(Model model, @PathVariable("code") String code,String captcha) {

        if (captcha != null)
            model.addAttribute("error", "Invalid Captcha!");
//
        User user = userRepository.findByPasswordRecoveryCode(code);
        if (user == null){
            return "redirect:/forgot?invalid";
        }
        model.addAttribute("code",code);
        model.addAttribute("password",new ChangePassword());
        model.addAttribute("code",code);
        model.addAttribute("page","reset");
        return "login/index";
    }

    @RequestMapping(value = "/reset/{code}", method = RequestMethod.POST)
    public String resetPost(Model model, @RequestParam(value = "g-recaptcha-response",required = false) String gCaptchaResponse,@PathVariable("code") String code, @ModelAttribute("password") ChangePassword password, BindingResult result) {


        if( ! verifyRecaptcha.verify(gCaptchaResponse)){

            return "redirect:/reset/"+code+"?captcha";
        }

        User user = userRepository.findByPasswordRecoveryCode(code);

        if (user == null){
            return "redirect:/forgot?invalid";
        }

        String error = null;

        if(password.getNewPassword().length()<8){
            error = " New password should be greater than 8 characters.";
        }

        if(! password.getNewPassword().equals(password.getConfirmPassword())){
            error =" New password & Confirm Password does not macth.";
        }


        if(result.hasErrors() || error!=null){

            model.addAttribute("error",error);
            model.addAttribute("password",new ChangePassword());
            model.addAttribute("code",code);
            model.addAttribute("page","reset");
            return "login/index";
        }

        user.setPasswordRecoveryCode("");

        user.setPassword(bCryptPasswordEncoder.encode(password.getNewPassword()));
        user.setUpdatedBy(user.getUsername());
        user.setUpdatedAt(new Date());
        userRepository.save(user);

        return "redirect:/login?message";
    }

}
