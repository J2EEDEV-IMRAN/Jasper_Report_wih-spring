package me.imran.personalblog.website.service;

import me.imran.personalblog.admin.model.Post;
import me.imran.personalblog.admin.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.*;
@Service
public class PostServiceImpl implements PostService {
 @Autowired
   PostRepository postRepository;
   @Override
   public List<Map<String, Object>> report() {
      List<Map<String, Object>> result=new ArrayList<Map<String,Object>>();
      for (Post post:postRepository.findAll()) {
         Map<String,Object> item=new HashMap<String,Object>();
         item.put("id",post.getId());
         item.put("postTitle",post.getPostTitle());
         item.put("post",post.getPost());
         item.put("postCategory",post.getPostCategory().getCategoryName());
         result.add(item);
      }
      return result;
   }
}
