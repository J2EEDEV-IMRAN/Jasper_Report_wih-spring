package me.imran.personalblog.login.service;

import org.springframework.security.core.Authentication;
/**
 * @author Imran Hossain
 */
public interface SecurityService {
    String findLoggedInUsername();
    void autologin(String username, String password);
    public boolean userHasPermissionForURL(final Authentication auth, String module, String url);

}
