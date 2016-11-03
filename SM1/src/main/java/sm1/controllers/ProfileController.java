package sm1.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfileController {
	
	@RequestMapping("/profile")
	public ModelAndView showProfilePage()
	{
		return new ModelAndView("profile");
	}

}
