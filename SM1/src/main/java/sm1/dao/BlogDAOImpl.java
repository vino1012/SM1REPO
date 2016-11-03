package sm1.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sm1.model.Blog;
import sm1.model.User;


@Repository
public class BlogDAOImpl implements BlogDAO {
	@Autowired
	SessionFactory sessionFactory;

	public void addBlog(Blog blog) {
		Session session;
		try
		{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}
		try
		{
		Transaction tx=session.beginTransaction();
		session.save(blog);
		tx.commit();
		}
		finally
		{
			session.close();
		}
		
		
	}

	@SuppressWarnings("unchecked")
	public List<Blog> viewBlogger() {
		Session session;
		List<Blog>blogs;
		try
		{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}
		
		
		try
		{
		blogs=session.createQuery("from Blog").list();		
		}
		finally
		{
			session.close();
		}

		return blogs;
	}

	public void deleteBlog(int id) {
		Session session;
		try
		{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}
		
	
		try
		{
			Blog blog=session.get(Blog.class,id);
			session.delete(blog);
		
		}
		finally
		{
			session.close();
		}
		
	}

	public Blog getBlog(int id) {
		Session session;
		Blog blog;
		try
		{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}
		
	
		try
		{
		blog=session.get(Blog.class,id);
		}
		finally
		{
			session.close();
		}
		
		
		return blog;
	}

	public void editBlog(Blog blog) {
		Session session;
		try
		{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}
		try
		{
		Transaction tx=session.beginTransaction();
		session.merge(blog);
		tx.commit();
		}
		finally
		{
			session.close();
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<Blog> viewBloggerByOwner(User owner) {
		Session session;
		List<Blog>blogs;
		try
		{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}
		
		
		try
		{
		blogs=session.createQuery("select bb from Blog bb where bb.owner = :owner")
		           .setParameter("owner",owner)
		           .list();	
		}
		finally
		{
			session.close();
		}

		return blogs;
	}

}
