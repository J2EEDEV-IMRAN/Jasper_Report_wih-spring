package me.imran.personalblog.login.model;


import lombok.Getter;
import lombok.Setter;
import me.imran.personalblog.admin.model.Role;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
/**
 * @author Imran Hossain
 */
@Entity
@Table(name = "users")
public class Login {
    private Long id;
    private String username;
    private String password;
    private String passwordConfirm;
    @Column(name="Approved")
    private Boolean approved;
    /*private Set<LoginRole> roles;*/
    private Set<LoginRole> roles=new HashSet<LoginRole>();

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getApproved() {
        return approved;
    }

    public void setApproved(Boolean approved) {
        this.approved = approved;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    /*@ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<LoginRole> getRoles() {
        return roles;
    }*/


    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<LoginRole> getRoles() {
        return roles;
    }


    public void setRoles(Set<LoginRole> roles) {
        this.roles = roles;
    }
}
