package me.imran.personalblog.login.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
/**
 * @author Imran Hossain
 */
@Entity
@Table(name = "role")

public class LoginRole {
    private Long id;
    private String name;
   /* private Set<Login> logins;*/
   private Set<Login> logins=new HashSet<Login>();

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   /* @ManyToMany(mappedBy = "roles")
    public Set<Login> getLogins() {
        return logins;
    }*/
   @ManyToMany(mappedBy="roles",fetch = FetchType.EAGER,cascade = CascadeType.MERGE)
   public Set<Login> getLogins() {
       return logins;
   }


    public void setLogins(Set<Login> logins) {
        this.logins = logins;
    }
}
