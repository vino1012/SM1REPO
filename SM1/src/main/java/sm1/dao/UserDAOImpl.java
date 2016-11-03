package sm1.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import sm1.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	SessionFactory sessionFactory;
	

	public void addUser(User u) {
		Session session;
		try{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}

		try
		{	
		Transaction tx=session.beginTransaction();
		session.save(u);
		tx.commit();
		}
		finally
		{
		session.close();
		}
		
		
		

		
	}
	

	public User getUserById(int id) {
		Session session=sessionFactory.getCurrentSession();
		
		
		User u=session.get(User.class,id);
		
		return u;
	
		
	}

	
	public User getUserByEmail(String email) {
		Session session;
		User u;
		try{
		session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e)
		{
			session=sessionFactory.openSession();
		}

	try{	
	u = (User)
			    session.createQuery("select ub from User ub where ub.email = :email")
			           .setString("email", email)
			           .uniqueResult();
	}
	finally
	{
		session.close();
	}
		return u;
		
		
	}

}
