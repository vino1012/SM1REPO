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

import sm1.model.Blog;
import sm1.model.BlogComments;
import sm1.model.User;
import sm1.service.BlogService;
import sm1.service.UserServiceImpl;

@Controller
public class BlogController {
	@Autowired
	BlogService bservice;
	@Autowired
	UserServiceImpl userservice;
	ObjectMapper obj=new ObjectMapper();
	
	List<Blog>blogList;
	List<Blog>ownBlogList;
	int lastbid;
	String oflag;
	
	@RequestMapping("/blog")
	public ModelAndView showblogpage()
	
	{
		String blogs="";
		String ownblogs="";
		System.out.println("In show blogpage");
		blogList=bservice.viewBlogger();
		User owner=userservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		ownBlogList=bservice.viewBloggerByOwner(owner);
		System.out.println("Before try block:");
		try {
			blogs=obj.writeValueAsString(blogList);
			ownblogs=obj.writeValueAsString(ownBlogList);
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
		System.out.println(blogs);
		System.out.println(ownblogs);
		ModelAndView blogview=new ModelAndView("blog");
		System.out.println("view created");
		blogview.addObject("blogs",blogs);
		blogview.addObject("ownblogs",ownblogs);
		System.out.println("attribute added");
		return blogview;
	
	}
	
	@RequestMapping("/blogpost")
	public ModelAndView showPostBlog(@ModelAttribute("blog")Blog blog)
	{
		return new ModelAndView("blogpost");
	}
	@RequestMapping("/edit")
	public String showEdit(@ModelAttribute("blog")Blog blog)
	{
		Blog temp=bservice.getBlog(lastbid);
		temp.setTitle(blog.getTitle());
		temp.setBlog_content(blog.getBlog_content());
		temp.setLastModified(new Date());
		bservice.editBlog(temp);
		return "redirect:blogview?bid="+lastbid;
	}
	@RequestMapping("/editblog")
	public ModelAndView showEditBlog(@ModelAttribute("blog")Blog blog,@RequestParam String bid)
	{
		Blog blogdata=bservice.getBlog(Integer.parseInt(bid));
		blog.setBlog_content(blogdata.getBlog_content());
		String blogstring="";
		try {
			blogstring=obj.writeValueAsString(blogdata);
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
		ModelAndView blogeditview=new ModelAndView("blogedit");
		blogeditview.addObject("blogstring",blogstring);
		return blogeditview;
	}
	
	@RequestMapping(value="/postblog", method=RequestMethod.POST)
	public String postBlog(@ModelAttribute("blog")Blog blog)
	{
		Date postedat=new Date();
		blog.setPostedAt(postedat);
		blog.setLastModified(postedat);
		
		
		User user=userservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		String postedBy=user.getFirstName()+" "+user.getLastName();
		blog.setPostedBy(postedBy);
		blog.setOwner(user);
		bservice.addBlog(blog);	
		return "redirect:blog";
	}
	
	@RequestMapping("/postblogcomment")
	public String postComment(@ModelAttribute("blogcomment")BlogComments blogcomment)
	{
		Date commentedAt=new Date();
		blogcomment.setCommentedAt(commentedAt);
		User user=userservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		String commentedby=user.getFirstName()+" "+user.getLastName();
		blogcomment.setCommentedby(commentedby);
		Blog temp=bservice.getBlog(lastbid);
		temp.getComments().add(blogcomment);
		bservice.editBlog(temp);
		return "redirect:blogview?bid="+lastbid;
	}
	
	@RequestMapping("/blogview")
	public ModelAndView showBlogView(@RequestParam String bid,@ModelAttribute("blogcomment")BlogComments blogcomment)
	{
		
		lastbid=Integer.parseInt(bid);
		boolean ownerflag=false;
		
		
		String blog="";
		String ownblogs="";
		String blogComments="";
		User currentUser=userservice.getUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		ownBlogList=bservice.viewBloggerByOwner(currentUser);
		Blog blogdata=(Blog)bservice.getBlog(lastbid);
		List<BlogComments>commentsData=blogdata.getComments();
		System.out.println(currentUser.getEmail());
		System.out.println(blogdata.getOwner().getEmail());
		if(currentUser.getEmail().equals(blogdata.getOwner().getEmail()))
		{
			ownerflag=true;
		}
		System.out.println(ownerflag);
		try {
			blog=obj.writeValueAsString(blogdata);
			ownblogs=obj.writeValueAsString(ownBlogList);
			oflag=obj.writeValueAsString(ownerflag);
			blogComments=obj.writeValueAsString(commentsData);
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
		ModelAndView blogview=new ModelAndView("blogview");
		blogview.addObject("blog", blog);
		blogview.addObject("ownblogs",ownblogs);
		blogview.addObject("oflag",oflag);
		blogview.addObject("blogComments", blogComments);
		System.out.println(blog);
		System.out.println(ownblogs);
		System.out.println(oflag);
		return blogview;
	}

}
