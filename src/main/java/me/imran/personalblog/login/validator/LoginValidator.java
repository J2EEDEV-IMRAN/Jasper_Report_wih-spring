package me.imran.personalblog.login.validator;

import me.imran.personalblog.login.model.Login;
import me.imran.personalblog.login.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
/**
 * @author Imran Hossain
 */
@Component
public class LoginValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(LoginValidator.class);
    @Autowired
    private UserService userService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Login.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Login login = (Login) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (login.getUsername().length() < 3 || login.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.loginForm.username");
        }
        if (userService.findByUsername(login.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.loginForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (login.getPassword().length() < 8 || login.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.loginForm.password");
        }

        if (!login.getPasswordConfirm().equals(login.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.loginForm.passwordConfirm");
        }
    }


    public void validateLogin(Object o, Errors errors) {
        Login login = (Login) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");


        if (userService.findByUsername(login.getUsername()) == null) {
            errors.rejectValue("username", "Duplicate.loginForm.username");
            return;
        }
        logger.info("Testing");
        try{
            UserDetails userDetails = userDetailsService.loadUserByUsername(login.getUsername());

            UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, login.getPassword(), userDetails.getAuthorities());

            authenticationManager.authenticate(usernamePasswordAuthenticationToken);
            if (!usernamePasswordAuthenticationToken.isAuthenticated()) {
                errors.rejectValue("username", "NotFoundLogin.loginForm.username");
            }
        }catch (Exception e){
            errors.rejectValue("username", "NotFoundLogin.loginForm.username");
        }
    }
}
