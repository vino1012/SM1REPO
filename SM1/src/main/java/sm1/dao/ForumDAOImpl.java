package sm1.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import sm1.model.Forum;

@Repository
public class ForumDAOImpl implements ForumDAO {
	@Autowired
	SessionFactory sessionFactory;
	

	public void addQuestion(Forum question) {
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
		session.save(question);
		tx.commit();
		}
		finally
		{
			session.close();
		}
		
		
	}


	@SuppressWarnings("unchecked")
	public List<Forum> viewForum() {
		Session session;
		List<Forum>questions;
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
		questions=session.createQuery("from Forum").list();
		
		
		}
		finally
		{
			session.close();
		}

		return questions;
	}
	

	@SuppressWarnings("unchecked")
	public List<Forum> viewForum(String contains) {
		String search="%"+contains+"%";
		Session session;
		List<Forum>questions;
		try
		{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}
		
	
		try{
		questions=session.createQuery("select f from Forum f where f.subject like :value").setString("value",search).list();
		}
		finally
		{
			session.close();
		}
		
		return questions;
		
	}


	public boolean deleteQuestion(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Forum getQuestion(int id) {
		Session session;
		Forum question;
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
		question=session.get(Forum.class,id);
		}
		finally
		{
			session.close();
		}
		
		
		return question;
	}


	public void updateQuestion(Forum question) {
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
		session.merge(question);
		tx.commit();
		}
		finally
		{
			session.close();
		}
		
		
	}

}
