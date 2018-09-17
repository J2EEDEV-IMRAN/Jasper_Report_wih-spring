package me.imran.personalblog.util;



import org.jsoup.Jsoup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * @author Imran Hossain
 */
public class Functions extends SimpleTagSupport {
    private static final Logger logger = LoggerFactory.getLogger(Functions.class);
    public static String replaceFirst(String input, String oldChar, Integer position, String newChar) {
        String output = input;
        logger.info("Input = "+input);

        if(oldChar.trim()==""){
            output = newChar+" "+input;
        }else{
            Integer index = input.indexOf(oldChar,0);
            if(index >=0){
                output = input.substring(0,index)+newChar+input.substring(index+1);
            }

        }

        return output;
    }
    public static String html2Text(String html) {

        return Jsoup.parse(html).text();
    }

    public static String replaceSpecialCharacter(String str){
        return str.replaceAll("(♣|♠|♦|♥)","");
    }

}
