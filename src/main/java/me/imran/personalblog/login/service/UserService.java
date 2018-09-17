package me.imran.personalblog.login.service;

import me.imran.personalblog.login.model.Login;
/**
 * @author Imran Hossain
 */
public interface UserService {
    void save(Login login);

    Login findByUsername(String username);
    Login findByUsernameAndPassword(String username,String password);
}
