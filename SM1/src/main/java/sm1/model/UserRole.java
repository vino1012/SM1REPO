package sm1.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="User_Role")
public class UserRole {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int user_role_id;
	private String Authority;
	
	public UserRole()
	{
		
	}
	public UserRole(String Authority)
	{
		if(Authority.equals("ROLE_ADMIN"))
		{
			this.user_role_id=1;
		}
		else if(Authority.equals("ROLE_USER"))
		{
			this.user_role_id=2;
		}
		this.Authority=Authority;
	}
	public int getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(int user_role_id) {
		this.user_role_id = user_role_id;
	}
	public String getAuthority() {
		return Authority;
	}
	public void setAuthority(String authority) {
		Authority = authority;
	}
	
	

}
