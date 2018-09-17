package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.User;
/*IMPORT_MODEL*/
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Imran Hossain
 */
@Repository
public interface UserDataTableRepository extends DataTablesRepository<User, Integer>{
}

