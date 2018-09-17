package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.PostTag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/*IMPORT_MODEL*/

/**
 * @author Imran Hossain
 */
@Repository
public interface PostTagRepository extends JpaRepository<PostTag, Integer> {
	List<PostTag> findAllByOrderByIdAsc();
	List<PostTag> findAllByOrderByIdDesc();
	Page<PostTag> findAllByOrderByIdAsc(Pageable page);
	Page<PostTag> findAllByOrderByIdDesc(Pageable page);

	List<PostTag> findByCreatedByOrderByIdAsc(String createdBy);
	List<PostTag> findByCreatedByOrderByIdDesc(String createdBy);
	Page<PostTag> findByCreatedByOrderByIdAsc(String createdBy, Pageable page);
	Page<PostTag> findByCreatedByOrderByIdDesc(String createdBy, Pageable page);


	@Query(value = "SELECT * FROM PostTag t order by id desc limit 1", nativeQuery=true)
	PostTag getNewPostTag();

}

