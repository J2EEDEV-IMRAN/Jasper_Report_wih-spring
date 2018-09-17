package me.imran.personalblog.login.repository;

import me.imran.personalblog.login.model.LoginRole;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author Imran Hossain
 */
public interface LoginRoleRepository extends JpaRepository<LoginRole, Long> {
    LoginRole findByName(String name);

    @Query(value = "SELECT * FROM role t where  t.name='ROLE_USER'", nativeQuery=true)
    List<LoginRole> findOneRole();
}
