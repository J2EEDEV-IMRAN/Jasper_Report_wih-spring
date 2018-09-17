package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.PostCategory;
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
public interface PostCategoryRepository extends JpaRepository<PostCategory, Integer> {
	List<PostCategory> findAllByOrderByIdAsc();
	List<PostCategory> findAllByOrderByIdDesc();
	List<PostCategory> findAllByOrderByOrderNoAsc();
	Page<PostCategory> findAllByOrderByIdAsc(Pageable page);
	Page<PostCategory> findById(Integer id,Pageable page);
	Page<PostCategory> findAllByOrderByIdDesc(Pageable page);
	Page<PostCategory> findAllByOrderByOrderNoAsc(Pageable page);
	List<PostCategory> findByCreatedByOrderByIdAsc(String createdBy);
	List<PostCategory> findByCreatedByOrderByIdDesc(String createdBy);
	Page<PostCategory> findByCreatedByOrderByIdAsc(String createdBy, Pageable page);
	Page<PostCategory> findByCreatedByOrderByIdDesc(String createdBy, Pageable page);


	@Query(value = "SELECT * FROM PostCategory t order by id desc limit 1", nativeQuery=true)
	PostCategory getNewPostCategory();

	@Query(value = "SELECT * FROM PostCategory t order by OrderNo asc limit 3", nativeQuery=true)
	List<PostCategory> findAllByOrderByOrderNoAscLim();
}

