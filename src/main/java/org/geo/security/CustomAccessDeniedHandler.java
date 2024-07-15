package org.geo.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j2;


@Log4j2
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

  @Override
  public void handle(HttpServletRequest request, 
      HttpServletResponse response, AccessDeniedException accessException)
      throws IOException, ServletException {

    log.error("Access Denied Handler");

    log.error("Redirect to /accessError....");
    
    
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    
    if (auth != null) {
        System.out.println("User '" + auth.getName() + "' attempted to access the protected URL: " + request.getRequestURI());
    }

//    System.out.println("Access Denied Handler: " + accessException.getMessage());
    
    log.debug("Access Denied Handler: " + accessException.getMessage());
    log.debug("Access Denied Handler: ", accessException);  // This will log the stack trace of the exception


    response.sendRedirect("/accessError");

  }

}
