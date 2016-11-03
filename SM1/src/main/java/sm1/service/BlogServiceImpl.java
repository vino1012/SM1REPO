package sm1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sm1.dao.BlogDAO;
import sm1.model.Blog;
import sm1.model.User;

@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
	BlogDAO blogdao;

	@Transactional
	public void addBlog(Blog blog) {
		blogdao.addBlog(blog);
		
	}
	
	@Transactional
	public List<Blog> viewBlogger() {
		
		return blogdao.viewBlogger();
	}
	
	@Transactional
	public void deleteBlog(int id) {
		blogdao.deleteBlog(id);
		
	}

	@Transactional
	public Blog getBlog(int id) {
		
		return blogdao.getBlog(id);
	}

	@Transactional
	public void editBlog(Blog blog) {
		blogdao.editBlog(blog);
		
	}
@Transactional
	public List<Blog> viewBloggerByOwner(User owner) {
	return blogdao.viewBloggerByOwner(owner);
	}

}
