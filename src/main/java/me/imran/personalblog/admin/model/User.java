package me.imran.personalblog.admin.model;

/**
 * @author Imran Hossain
 */
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.fasterxml.jackson.annotation.*;

import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

import javax.persistence.*;
import java.util.*;


@Entity
@Table(name="users")
//@EntityListeners(UserEntityListener.class)
public class User implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    @Getter
    @Setter
    @JsonView(DataTablesOutput.View.class)
    private Integer id;


	@Getter
	@Setter
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles=new HashSet<Role>();



	@Getter
	@Setter
	@Column(name="username",unique=true)
	@JsonView(DataTablesOutput.View.class)
	private String username;
	
	
	@Getter
	@Setter
	@Column(name="password")
	@JsonView(DataTablesOutput.View.class)
	private String password;
	
	
	@Getter
	@Setter
	@Column(name="FullNameEnglish")
	@JsonView(DataTablesOutput.View.class)
	private String fullNameEnglish;

	
	
	@Getter
	@Setter
	@Column(name="Phone",unique=true)
	@JsonView(DataTablesOutput.View.class)
	private String phone;
	
	
	@Getter
	@Setter
	@Column(name="Email",unique=true)
	@JsonView(DataTablesOutput.View.class)
	private String email;
	
	
	@Getter
	@Setter
	@Column(name="isSuperUser")
	@JsonView(DataTablesOutput.View.class)
	private Boolean isSuperUser;
	
	
	@Getter
	@Setter
	@Column(name="Approved")
	@JsonView(DataTablesOutput.View.class)
	private Boolean approved;
	
	
	@Getter
	@Setter
	@Column(name="password_recovery_code")
	@JsonView(DataTablesOutput.View.class)
	private String passwordRecoveryCode;
	
	
	@Getter
	@Setter
	@Column(name="is_temporary_password")
	@JsonView(DataTablesOutput.View.class)
	private Boolean isTemporaryPassword;
	

    @Getter
    @Setter
    @Column(name="CreatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  createdBy;
            
    @Getter
    @Setter
    @Column(name="CreatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date createdAt;
            
    @Getter
    @Setter
    @Column(name="UpdatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  updatedBy;
            
    @Getter
    @Setter
    @Column(name="UpdatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date updatedAt;

    public User() {
        super();
    }


}