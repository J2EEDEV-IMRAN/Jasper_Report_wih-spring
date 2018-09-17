package me.imran.personalblog.login.service;

import me.imran.personalblog.login.model.Login;
import me.imran.personalblog.login.repository.LoginRepository;
import me.imran.personalblog.login.repository.LoginRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
/**
 * @author Imran Hossain
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private LoginRepository loginRepository;
    @Autowired
    private LoginRoleRepository roleRepository;
    @Autowired
    private LoginRoleRepository loginRoleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(Login login) {
        login.setPassword(bCryptPasswordEncoder.encode(login.getPassword()));
        login.setRoles(new HashSet<>(loginRoleRepository.findOneRole()));
        loginRepository.save(login);
    }

    @Override
    public Login findByUsername(String username) {
        Login login = loginRepository.findByUsername(username);
        return login;
    }
    @Override
    public Login findByUsernameAndPassword(String username,String password) {
        Login login = loginRepository.findByUsernameAndPassword(username,password);
        return login;
    }

}
