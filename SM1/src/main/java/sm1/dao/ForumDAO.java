package sm1.dao;

import java.util.List;

import sm1.model.Forum;



public interface ForumDAO {
	public abstract void addQuestion(Forum question);
	public List<Forum> viewForum();
	public List<Forum> viewForum(String contains);
	public abstract boolean deleteQuestion(int id);
	public Forum getQuestion(int id);
	public void updateQuestion(Forum question);

}
