package sm1.dao;

import java.util.List;

import sm1.model.Blog;
import sm1.model.User;

public interface BlogDAO {
	public abstract void addBlog(Blog blog);
	public List<Blog> viewBlogger();
	public List<Blog> viewBloggerByOwner(User owner);
	public abstract void deleteBlog(int id);
	public Blog getBlog(int id);
	public void editBlog(Blog blog);

}
