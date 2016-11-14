package sm1.controllers;


import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import sm1.model.Message;
import sm1.model.OutputMessage;
import sm1.model.User;
import sm1.service.UserService;

@Controller
public class ProfileController {
	@Autowired
	UserService userservice;
	ObjectMapper obj=new ObjectMapper();
	User loggedUser;
	
	
	@RequestMapping("/profile")
	public ModelAndView showProfilePage(@ModelAttribute("FileObj")User temp)
	{
		User currentUser=userservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		loggedUser=currentUser;
		File f=new File("I:/SM1GITREPO/SM1/src/main/webapp/dist/Images/propic"+loggedUser.getUser_id()+"u.jpg");
		String imageStringtemp="";
		String imageString="";
		if(f.exists())
		{
			imageStringtemp=f.getName();
		}
		else
		{
			imageStringtemp="profile-default.jpg";
		}
		currentUser.setPassword("");
		String userString="";
		try {
			userString=obj.writeValueAsString(currentUser);
			imageString=obj.writeValueAsString(imageStringtemp);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(userString);
		System.out.println(imageString);
		ModelAndView profileView=new ModelAndView("profile");
		profileView.addObject("userString",userString);
		profileView.addObject("imageString",imageString);
		System.out.println("Attribute Added");
		return profileView;
	}
	
	@RequestMapping(value="/profile",method=RequestMethod.POST)
	public String uploadPic(@ModelAttribute("FileObj")User temp) throws IOException
	{	
		System.out.println("Hello");
		System.out.println(temp.getFile().getOriginalFilename());
		FileCopyUtils.copy(temp.getFile().getBytes(), new File("I:/SM1GITREPO/SM1/src/main/webapp/dist/Images/propic"+loggedUser.getUser_id()+"u.jpg"));
		return "redirect:profile";
	}
	
	@RequestMapping("/chats")
	  public ModelAndView viewApplication() {
	    return new ModelAndView("chat");
	  }
	    
	  @MessageMapping("/chat")
	  @SendTo("/topic/message")
	  public OutputMessage sendMessage(Message message,Principal principal) {
		User currentUser=userservice.getUserByEmail(principal.getName());
	    return new OutputMessage(message, new Date(),currentUser.getFirstName()+" "+currentUser.getLastName());
	  }

}