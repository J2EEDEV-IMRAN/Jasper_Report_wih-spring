package me.imran.personalblog.util;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import javax.servlet.jsp.JspException;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

import java.util.Map;
import java.util.regex.Pattern;

/**
 * @author Imran Hossain
 */
public class ActLink extends SimpleTagSupport {
    private String text;
    private String contextPath;
    private String output;
    private Object actShortList;
    private static final Logger logger = LoggerFactory.getLogger(ActLink.class);
    @Override
    public void doTag() throws JspException, IOException {
        Map<String,Integer> actShorts = (Map<String,Integer>) actShortList;

        for (String k: actShorts.keySet()
             ) {
            String key = k.trim();

            if(key.startsWith("The")){
                key = key.substring(3).trim();
            }

            if(key.split(",").length >1 && key.split(",")[1].trim().endsWith(")")){
                key = key.substring(0,key.lastIndexOf("("));
            }

            Integer actId = actShorts.get(k);

            text = text.replaceAll("(?i)"+Pattern.quote(key),"<a title='"+key+"' href='"+contextPath+"/act-"+actId+".html'>"+key+"</a>");
        }

        if(output=="" || output==null){
            getJspContext().getOut().println(text);
        }else {
            getJspContext().setAttribute(output,text);
        }

    }

    public String getContextPath() {
        return contextPath;
    }

    public void setContextPath(String contextPath) {
        this.contextPath = contextPath;
    }

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
    public Object getActShortList() {
        return actShortList;
    }

    public void setActShortList(Object actShortList) {
        this.actShortList = actShortList;
    }
}
