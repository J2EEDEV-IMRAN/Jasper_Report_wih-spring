package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.User;
/*IMPORT_MODEL*/
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Imran Hossain
 */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	List<User> findAllByOrderByIdAsc();
	List<User> findAllByOrderByIdDesc();
	Page<User> findAllByOrderByIdAsc(Pageable page);
	Page<User> findAllByOrderByIdDesc(Pageable page);

	List<User> findByCreatedByOrderByIdAsc(String createdBy);
	List<User> findByCreatedByOrderByIdDesc(String createdBy);
	Page<User> findByCreatedByOrderByIdAsc(String createdBy,Pageable page);
	Page<User> findByCreatedByOrderByIdDesc(String createdBy,Pageable page);


	User findByPasswordRecoveryCode(String passwordRecoveryCode);List<User> findAllByOrderByUsernameAsc();
		User findByUsername(String username);
	User findByPhone(String phone);
	User findByEmail(String email);
	
	/*EXTRA*/
			

}

