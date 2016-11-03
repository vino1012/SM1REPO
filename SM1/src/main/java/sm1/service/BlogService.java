package sm1.service;

import java.util.List;

import sm1.model.Blog;
import sm1.model.User;



public interface BlogService {

	public void addBlog(Blog blog);
	public List<Blog> viewBlogger();
	public List<Blog> viewBloggerByOwner(User owner);
	public void deleteBlog(int id);
	public Blog getBlog(int id);
	public void editBlog(Blog blog);
}
