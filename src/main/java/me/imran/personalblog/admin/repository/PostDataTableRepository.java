package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Post;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

/*IMPORT_MODEL*/
/**
 * @author Imran Hossain
 */

@Repository
public interface PostDataTableRepository extends DataTablesRepository<Post, Integer>{
}

