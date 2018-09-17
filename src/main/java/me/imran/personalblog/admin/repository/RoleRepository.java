package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Role;
/*IMPORT_MODEL*/
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Imran Hossain
 */
@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
	List<Role> findAllByOrderByIdAsc();
	List<Role> findAllByOrderByIdDesc();
	Page<Role> findAllByOrderByIdAsc(Pageable page);
	Page<Role> findAllByOrderByIdDesc(Pageable page);

	List<Role> findByCreatedByOrderByIdAsc(String createdBy);
	List<Role> findByCreatedByOrderByIdDesc(String createdBy);
	Page<Role> findByCreatedByOrderByIdAsc(String createdBy,Pageable page);
	Page<Role> findByCreatedByOrderByIdDesc(String createdBy,Pageable page);


	List<Role> findAllByOrderByNameAsc();


	@Query(value = "SELECT * FROM role t order by id desc", nativeQuery=true)
	List<Role> findAllRoles();
	/*EXTRA*/
			

}

