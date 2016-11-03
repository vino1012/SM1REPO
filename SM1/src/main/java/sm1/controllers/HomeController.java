package sm1.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sm1.model.User;
import sm1.model.UserRole;
import sm1.service.UserServiceImpl;


@Controller
public class HomeController {
	@Autowired
	UserServiceImpl userops;


	@RequestMapping(value={"/","/home"})
	public ModelAndView showHome()
	
	{
	
		return new ModelAndView("home");
	}
	@RequestMapping("/login")
	public ModelAndView showLogin()
	{
		return new ModelAndView("login");
	}
	
	@RequestMapping("/logout")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		System.out.println("logout");
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
	@RequestMapping("/signup")
	public ModelAndView showSignup(@ModelAttribute("userobj")User userobj)
	{
	
		return new ModelAndView("signup");
	}
	@RequestMapping("/adduser")
	public String signup(@ModelAttribute("userobj")User userobj)
	{
		userobj.setEnabled(true);
		userobj.setUserrole(new UserRole("ROLE_USER"));
		userops.addUser(userobj);
		return "redirect:login";
		
		
	}
	

}
