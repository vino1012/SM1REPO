package sm1.controllers;


import java.io.IOException;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sm1.model.Forum;
import sm1.model.ForumAnswer;
import sm1.model.User;

import sm1.service.ForumAnswerServiceImpl;

import sm1.service.ForumServiceImpl;
import sm1.service.UserServiceImpl;



@Controller
public class ForumController {
	
	@Autowired
	UserServiceImpl userservice;
	@Autowired
	ForumServiceImpl fservice;
	@Autowired
	ForumAnswerServiceImpl faservice;
	int lastid;
	ObjectMapper obj=new ObjectMapper();
	List<Forum>questionList;
	

	
	@RequestMapping("/forum")
	public ModelAndView showForum()
	{
		String questions="";
		System.out.println("In show forum");
		questionList=fservice.getQuestions();
		
		System.out.println("Before try block:");
		try {
			questions=obj.writeValueAsString(questionList);
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
		System.out.println("after try block");
		System.out.println(questions);
		ModelAndView forumview=new ModelAndView("forum");
		System.out.println("view created");
		forumview.addObject("questions",questions);
		System.out.println("attribute added");
		return forumview;
	}
	
	@RequestMapping(value="/postForum", method=RequestMethod.POST)
	public String postForum(@ModelAttribute("question")Forum forum)
	{
		Date postedat=new Date();
		forum.setPostedat(postedat);
		
		User user=userservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		String postedBy=user.getFirstName()+" "+user.getLastName();
		forum.setPostedBy(postedBy);
		System.out.println(forum.getSubject()+"\n"+forum.getDescription()+"\n"+forum.getPostedat()+"\n"+forum.getPostedBy());
		fservice.addQuestion(forum);
		return "redirect:forum";
	}
	
	@RequestMapping(value="/answer", method=RequestMethod.POST)
	public String postAnswer(@ModelAttribute("fanswer")ForumAnswer fanswer)
	{
		Date answeredat=new Date();
		fanswer.setAnsweredat(answeredat);

		User user=userservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		String answeredby=user.getFirstName()+" "+user.getLastName();
		fanswer.setAnsweredby(answeredby);
		Forum temp=fservice.getQuestion(lastid);
		List<ForumAnswer>answerlist=temp.getAnswer();
		answerlist.add(fanswer);
		temp.setAnswer(answerlist);
		fservice.updateQuestion(temp);
		System.out.println(fanswer.getAnsweredby()+fanswer.getAnsweredat()+fanswer.getForum_answer());
		return "redirect:viewquestion?fid="+lastid;
	}
	
	@RequestMapping("/askquestion")
	public ModelAndView showPostForum(@ModelAttribute("question")Forum forum)
	{
		return new ModelAndView("forumpost");
	}
	
	@RequestMapping("/searchforum")
	public ModelAndView searchForum(@RequestParam String contains)
	{
		System.out.println(contains);
		questionList=fservice.getQuestions(contains);
		String questions="";
		
		try {
			questions=obj.writeValueAsString(questionList);
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
		System.out.println(questions);
		return new ModelAndView("forum").addObject("questions", questions);
	}
	
	@RequestMapping("/viewquestion")
	public ModelAndView forumView(@RequestParam String fid,@ModelAttribute("fanswer")ForumAnswer fanswer)
	{
		System.out.println(fid);
		int id=Integer.parseInt(fid);
		lastid=id;
		System.out.println(id);
		String question="";
		String answers="";
		Forum questionObj=fservice.getQuestion(id);
		List<ForumAnswer>anslist=questionObj.getAnswer();
		
		ModelAndView forumview=new ModelAndView("forumview");
		
		
		try {
			question=obj.writeValueAsString(questionObj);
			answers=obj.writeValueAsString(anslist);
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
		forumview.addObject("question",question);
		forumview.addObject("answers",answers);
		System.out.println(question);
		System.out.println(answers);
		return forumview;
	}


}
