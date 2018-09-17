package me.imran.personalblog.util.repository;

import me.imran.personalblog.util.model.MessageResource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 * @author Imran Hossain
 */
@Repository
public interface MessageResourceRepository extends JpaRepository<MessageResource, Integer> {
    MessageResource findByCodeAndLocale(String code,String locale);
}

