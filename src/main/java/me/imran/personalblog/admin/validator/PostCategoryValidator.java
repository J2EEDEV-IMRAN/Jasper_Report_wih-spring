package me.imran.personalblog.admin.validator;

import me.imran.personalblog.admin.model.PostCategory;
import me.imran.personalblog.admin.repository.PostCategoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;
/**
 * @author Imran Hossain
 */
@Component
public class PostCategoryValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(PostCategoryValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");
	@Autowired
	PostCategoryRepository postCategoryRepository;
	public boolean supports(Class<?> clazz) {
		return PostCategory.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		PostCategory postCategory = (PostCategory) target;

		
		if(postCategory.getCategoryName()==null){
			errors.rejectValue("categoryName","PostCategory.categoryName.required");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "categoryName", "PostCategory.categoryName.required");

		
		
		
	}
}
