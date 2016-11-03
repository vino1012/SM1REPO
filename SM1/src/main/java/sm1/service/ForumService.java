package sm1.service;

import java.util.List;

import sm1.model.Forum;

public interface ForumService {
	void addQuestion(Forum question);
	void updateQuestion(Forum question);
	List<Forum> getQuestions();
	List<Forum> getQuestions(String contains);
	Forum getQuestion(int id);

}
