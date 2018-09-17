package me.imran.personalblog.exception;


import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
/**
 * @author Imran Hossain
 */
@ControllerAdvice
public class GlobalExceptionController {


    @ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView handlerNoHandlerFoundException() {

        ModelAndView modelAndView = new ModelAndView("404");
        return modelAndView;
    }
}
