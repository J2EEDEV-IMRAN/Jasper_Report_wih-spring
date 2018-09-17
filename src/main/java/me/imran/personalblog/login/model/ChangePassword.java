package me.imran.personalblog.login.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * @author Imran Hossain
 */

public class ChangePassword {
    @Getter
    @Setter
    String newPassword;
    @Getter
    @Setter
    String confirmPassword;
    public ChangePassword(){
    }
}
