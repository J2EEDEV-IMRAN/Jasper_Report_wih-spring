
package me.imran.personalblog.website.controller;


import me.imran.personalblog.admin.model.*;
import me.imran.personalblog.admin.repository.*;
import me.imran.personalblog.login.util.VerifyRecaptcha;
import me.imran.personalblog.website.service.PostService;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.jsoup.Jsoup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;




/**
 * @author Imran Hossain
 */

@Controller
public class HomeController  {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    @Autowired
    ApplicationContext applicationContext;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    PostRepository postRepository;
    @Autowired
    PostCategoryRepository   postCategoryRepository;
    @Autowired
    PostTagRepository postTagRepository;
    @Autowired
    PostService postService;
    @Autowired
    VerifyRecaptcha verifyRecaptcha;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);


    }


    @RequestMapping(value = {"", "/", "index.html"}, method = RequestMethod.GET)
    public String indexPage(Model model, Locale locale, HttpServletRequest request) {
        model.addAttribute("page", "home");


        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        List<Post> PostList=postRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("PostList",PostList);
        return "website/index";
    }

    @RequestMapping(value = { "/generateReport" }, method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getRpt1(HttpServletResponse response) throws JRException, IOException {

        JasperReportsPdfView view=new JasperReportsPdfView();
        view.setUrl("classpath:/report/jsperreport.jrxml");
        view.setApplicationContext(applicationContext);
        Map<String,Object> params =new HashMap<String,Object>();
        params.put("datasource",postService.report());
        return new ModelAndView(view,params);
    }
    @RequestMapping(value = { "/generateReportGroup" }, method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getRpt1Group(HttpServletResponse response) throws JRException, IOException {

        JasperReportsPdfView view=new JasperReportsPdfView();
        view.setUrl("classpath:/report/jsperreportgroup.jrxml");
        view.setApplicationContext(applicationContext);
        Map<String,Object> params =new HashMap<String,Object>();
        params.put("datasource",postService.report());
        return new ModelAndView(view,params);
    }



  }

