package me.imran.personalblog.admin.validator;
import me.imran.personalblog.admin.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import me.imran.personalblog.admin.model.User;

import java.util.regex.Pattern;
/**
 * @author Imran Hossain
 */
@Component
public class UserValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(UserValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");
	@Autowired
    UserRepository userRepository;
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "field_name", "validation.properties");
		
		//Business validation

		// if(condition){
		// 	errors.rejectValue("field_name","validation.properties");
		// }

		

		if(userRepository.findByUsername(user.getUsername())!=null && user.getId()!=userRepository.findByUsername(user.getUsername()).getId()){
		 	errors.rejectValue("username","User.username.is_unique");
		}


		if(user.getUsername()!=null && user.getUsername().length() >50 ){
			errors.rejectValue("username","User.username.max_length");
		}


		if(user.getFullNameEnglish()!=null && user.getFullNameEnglish().length() >255 ){
			errors.rejectValue("fullNameEnglish","User.fullNameEnglish.max_length");
		}


/*		if(user.getFullNameBangla()!=null && user.getFullNameBangla().length() >255 ){
			errors.rejectValue("fullNameBangla","User.fullNameBangla.max_length");
		}


		if(user.getDesignationEnglish()!=null && user.getDesignationEnglish().length() >255 ){
			errors.rejectValue("designationEnglish","User.designationEnglish.max_length");
		}


		if(user.getDesignationBangla()!=null && user.getDesignationBangla().length() >255 ){
			errors.rejectValue("designationBangla","User.designationBangla.max_length");
		}*/


		if(userRepository.findByPhone(user.getPhone())!=null && user.getId()!=userRepository.findByPhone(user.getPhone()).getId()){
		 	errors.rejectValue("phone","User.phone.is_unique");
		}


		if(user.getPhone()!=null && user.getPhone().length() >15 ){
			errors.rejectValue("phone","User.phone.max_length");
		}


		if(userRepository.findByEmail(user.getEmail())!=null && user.getId()!=userRepository.findByEmail(user.getEmail()).getId()){
		 	errors.rejectValue("email","User.email.is_unique");
		}


		if(emailPattern.matcher(user.getEmail()).matches()==false){
			errors.rejectValue("email","User.email.valid_email");
		}


		if(user.getEmail()!=null && user.getEmail().length() >50 ){
			errors.rejectValue("email","User.email.max_length");
		}

		if(user.getIsSuperUser()==null){
			errors.rejectValue("isSuperUser","User.isSuperUser.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isSuperUser", "User.isSuperUser.required");

		if(user.getApproved()==null){
			errors.rejectValue("approved","User.approved.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "approved", "User.approved.required");


		if(user.getPasswordRecoveryCode()!=null && user.getPasswordRecoveryCode().length() >20 ){
			errors.rejectValue("passwordRecoveryCode","User.passwordRecoveryCode.max_length");
		}

		if(user.getIsTemporaryPassword()==null){
			errors.rejectValue("isTemporaryPassword","User.isTemporaryPassword.required");
		}
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isTemporaryPassword", "User.isTemporaryPassword.required");

		
		
		
	}
}
