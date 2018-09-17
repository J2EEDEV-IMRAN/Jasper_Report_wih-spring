package me.imran.personalblog.admin.validator;

import me.imran.personalblog.admin.model.Post;
import me.imran.personalblog.admin.model.PostTag;
import me.imran.personalblog.admin.repository.PostTagRepository;
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
public class PostValidator implements Validator {
	private static final Logger logger        = LoggerFactory.getLogger(PostValidator.class);
	private static final Pattern emailPattern = Pattern.compile("/^([a-z0-9\\+_\\-]+)(\\.[a-z0-9\\+_\\-]+)*@([a-z0-9\\-]+\\.)+[a-z]{2,6}$/i");

	@Autowired
    PostTagRepository postTagRepository;

	public boolean supports(Class<?> clazz) {
		return PostTag.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		Post post= (Post) target;

		
		if(post.getPost()==null){
			errors.rejectValue("post","Post.post.required");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "post", "Post.post.required");

		
	}
}
