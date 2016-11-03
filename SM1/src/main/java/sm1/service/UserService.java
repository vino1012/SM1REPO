package sm1.service;

import sm1.model.User;

public interface UserService {

	public void addUser(User u);
	public User getUserById(int id);
	public User getUserByEmail(String email);
	
}
