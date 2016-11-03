package sm1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sm1.dao.UserDAOImpl;
import sm1.model.User;

@Service
@Component
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAOImpl cuser;
	
	@Transactional
	public void addUser(User u) {
		cuser.addUser(u);
		
	}

	@Transactional
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return cuser.getUserById(id);
	}

	@Transactional
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return cuser.getUserByEmail(email);
	}

}
