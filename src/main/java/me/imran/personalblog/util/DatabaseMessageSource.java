package me.imran.personalblog.util;

import me.imran.personalblog.util.model.MessageResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Component;

import java.text.MessageFormat;
import java.util.Locale;
/**
 * @author Imran Hossain
 */
@Component
public class DatabaseMessageSource extends ReloadableResourceBundleMessageSource {
    @Autowired
    private MessageResourceService messageResourceService;
    @Override
    public MessageFormat resolveCode(String code, Locale locale) {

        MessageResource messageResource = messageResourceService.findByCodeAndLocale(code,locale.getLanguage());

        MessageFormat format;

        if (messageResource!= null && messageResource.getId() != null) {

            format = new MessageFormat(messageResource.getValue(), locale);

        } else {

            format = super.resolveCode(code, locale);

        }

        return format;

    }
    @Override
    public String resolveCodeWithoutArguments(String code, Locale locale) {

        MessageResource messageResource = messageResourceService.findByCodeAndLocale(code,locale.getLanguage());

        String format;

        if (messageResource != null && messageResource.getId() != null) {

            format = messageResource.getValue();

        } else {

            format = super.resolveCodeWithoutArguments(code, locale);

        }

        return format;

    }
}
