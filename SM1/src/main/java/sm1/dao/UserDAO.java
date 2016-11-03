package sm1.dao;

import sm1.model.User;

public interface UserDAO {

	public void addUser(User u);
	public User getUserById(int id);
	public User getUserByEmail(String email);
	
}
