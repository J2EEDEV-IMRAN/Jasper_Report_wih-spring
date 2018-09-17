package me.imran.personalblog.util;

import me.imran.personalblog.util.model.MessageResource;
import me.imran.personalblog.util.repository.MessageResourceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Imran Hossain
 */
@Service
public class MessageResourceService {
    @Autowired
    MessageResourceRepository messageResourceRepository;
    public MessageResource findByCodeAndLocale(String code, String locale){
        return messageResourceRepository.findByCodeAndLocale(code,locale);
    }
}
