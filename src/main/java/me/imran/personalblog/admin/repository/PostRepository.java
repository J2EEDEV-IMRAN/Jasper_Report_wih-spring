package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/*IMPORT_MODEL*/
/**
 * @author Imran Hossain
 */
@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {
	List<Post> findAllByOrderByIdAsc();
	List<Post> findAllByOrderByIdDesc();
	Page<Post> findAllByOrderByIdAsc(Pageable page);
	Page<Post> findAllByOrderByIdDesc(Pageable page);
	List<Post> findByCreatedByOrderByIdAsc(String createdBy);
	List<Post> findByCreatedByOrderByIdDesc(String createdBy);
	Page<Post> findByCreatedByOrderByIdAsc(String createdBy, Pageable page);
	Page<Post> findByCreatedByOrderByIdDesc(String createdBy, Pageable page);

	List<Post> findAllByOrderByOrderNoAsc();

	@Query(value = "SELECT * FROM Post t order by id desc limit 4", nativeQuery=true)
	List<Post> findAllPopularPost();

	@Query(value = "SELECT * FROM Post t order by id desc limit 1", nativeQuery=true)
	Post getNewPost();
/*	@Query(value = "SELECT * FROM Post t where t.postCategoryId=:id order by id desc", nativeQuery=true)
	Page<Post> findAllByCategory(@Param("id") Integer id, Pageable pageable);*/

	@Query(
			value = "select * from Post t where  t.postCategoryId=?1 ORDER BY ?#{#pageable}",
			countQuery = "select count(*) from Post t where t.postCategoryId=?1 ORDER BY ?#{#pageable}",
			nativeQuery = true)
	Page<Post> findAllByCategory(Integer id, Pageable pageable);

	@Query(
			value = "select * from Post t  INNER JOIN POST_TAG_MAP tm ON t.id = tm.POST_ID    where  tm.TAG_ID=?1 ORDER BY ?#{#pageable}",
			countQuery = "select count(*) from Post t  INNER JOIN POST_TAG_MAP tm ON t.id = tm.POST_ID    where  tm.TAG_ID=?1 ORDER BY ?#{#pageable}",
			nativeQuery = true)
	Page<Post> findAllByTag(Integer id, Pageable pageable);

	@Query(value = "SELECT * FROM Post t where t.CreatedAt<?1 ORDER BY  t.CreatedAt desc limit 1", nativeQuery=true)
	Post findPreviousPost(Date createdAt);

	@Query(value = "SELECT * FROM Post t where t.CreatedAt>?1 ORDER BY  t.CreatedAt asc limit 1", nativeQuery=true)
	Post findNextPost(Date createdAt);

	@Query(
			value = "select * from Post t where  t.PostTitle like %?1% or t.post like %?1% ORDER BY ?#{#pageable}",
			countQuery = "select count(*) from Post t where t.PostTitle like %?1% or t.post like %?1% ORDER BY ?#{#pageable}",
			nativeQuery = true)
	Page<Post> findAllByString(String search,Pageable pageable);

	@Query(value = "SELECT DISTINCT DATE_FORMAT(t.CreatedAt, '%M,%Y')  FROM Post t", nativeQuery=true)
	List<Date> findAllPopularPostByYear();
	@Query(
			value = "SELECT * FROM Post t WHERE DATE_FORMAT(t.CreatedAt, '%M,%Y') = DATE_FORMAT(STR_TO_DATE(?1, '%m,%Y'),'%M,%Y') ORDER BY ?#{#pageable}",
			countQuery = "SELECT * FROM Post t WHERE DATE_FORMAT(t.CreatedAt, '%M,%Y') = DATE_FORMAT(STR_TO_DATE(?1, '%m,%Y'),'%M,%Y') ORDER BY ?#{#pageable}",
			nativeQuery = true)
	Page<Post> findAllByStringYear(String year,Pageable pageable);

	@Query(value = "SELECT * FROM Post t  ORDER BY  t.id desc limit 1", nativeQuery=true)
	Post findLastPost();
}

