package sm1.dao;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import sm1.model.ForumAnswer;

@Repository
public class ForumAnswerDAOImpl implements ForumAnswerDAO {
	@Autowired
	SessionFactory sessionFactory;

	
	public void saveAnswer(ForumAnswer fanswer) {
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
		session.save(fanswer);
		tx.commit();
		}
		finally{
			session.close();
		}
		
		
	
		
		
	}

}
