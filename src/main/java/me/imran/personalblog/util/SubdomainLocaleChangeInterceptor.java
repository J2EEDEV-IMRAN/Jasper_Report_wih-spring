package me.imran.personalblog.util;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Imran Hossain
 */
public class SubdomainLocaleChangeInterceptor extends LocaleChangeInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
        String domain = request.getServerName();
        String newLocale;

        /**
         * locale set by subdomain
         */
        try {
            String language = domain.substring(0, domain.indexOf('.'));
            switch (language.toLowerCase()){
                case "bangla":
                case "bn":
                    newLocale = "bn";
                    break;
                case "en":
                    newLocale = "en";
                    break;
                default:
                    newLocale = "en";
                    break;
            }

        }catch (Exception ex){
            newLocale = "en";
        }

        if(request.getParameter(this.getParamName())!=null){
            newLocale = request.getParameter(this.getParamName());
        }

        if(newLocale != null) {
            LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
            if(localeResolver == null) {
                throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
            }

            localeResolver.setLocale(request, response, StringUtils.parseLocaleString(newLocale));
        }

        return true;
    }
}
