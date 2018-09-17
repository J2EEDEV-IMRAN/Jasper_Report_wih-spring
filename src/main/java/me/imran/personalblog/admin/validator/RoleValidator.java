package me.imran.personalblog.admin.validator;
import me.imran.personalblog.admin.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import me.imran.personalblog.admin.model.Role;

import java.util.regex.Pattern;
/**
 * @author Imran Hossain
 */
@Component
public class RoleValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(RoleValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");
	@Autowired
    RoleRepository roleRepository;
	public boolean supports(Class<?> clazz) {
		return Role.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		Role role = (Role) target;
		
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "field_name", "validation.properties");
		
		//Business validation

		// if(condition){
		// 	errors.rejectValue("field_name","validation.properties");
		// }

		

		if(role.getName()!=null && role.getName().length() >45 ){
			errors.rejectValue("name","Role.name.max_length");
		}

		
		
		
	}
}
