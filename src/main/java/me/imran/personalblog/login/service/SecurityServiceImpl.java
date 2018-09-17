package me.imran.personalblog.login.service;

import me.imran.personalblog.admin.model.User;
import me.imran.personalblog.admin.repository.UserRepository;
import me.imran.personalblog.login.model.Login;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
/**
 * @author Imran Hossain
 */
@Service
public class SecurityServiceImpl implements SecurityService {
    private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    UserRepository userRepository;
    @Override
    public String findLoggedInUsername() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (userDetails instanceof UserDetails) {
            return ((UserDetails) userDetails).getUsername();
        }

        return null;
    }

    public boolean userHasPermissionForURL(final Authentication auth, String module, String url) {

        Login login = (Login) auth.getPrincipal();

        User user = userRepository.findByUsername(login.getUsername());

        if(user.getIsSuperUser()){
            return true;
        }



        return true;
    }
    @Override
    public void autologin(String username, String password) {

        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());

        authenticationManager.authenticate(usernamePasswordAuthenticationToken);

        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            logger.debug(String.format("Auto login %s successfully!", username));
        }
    }
}
