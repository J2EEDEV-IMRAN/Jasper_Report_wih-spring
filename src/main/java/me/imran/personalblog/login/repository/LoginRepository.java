package me.imran.personalblog.login.repository;

import me.imran.personalblog.login.model.Login;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Imran Hossain
 */
public interface LoginRepository extends JpaRepository<Login, Long>{
    Login findByUsername(String username);
    Login findByUsernameAndPassword(String username,String password);
}
