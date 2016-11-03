package sm1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sm1.dao.ForumDAOImpl;
import sm1.model.Forum;

@Service
public class ForumServiceImpl implements ForumService {
	@Autowired
	ForumDAOImpl frmdao;
	
	@Transactional
	public void addQuestion(Forum question) {
		frmdao.addQuestion(question);
		
	}

    @Transactional
	public List<Forum> getQuestions() {
		List<Forum>questions=frmdao.viewForum();
		return questions;
	}

    @Transactional
	public List<Forum> getQuestions(String contains) {
		List<Forum>questions=frmdao.viewForum(contains);
		return questions;
	}

    @Transactional
	public Forum getQuestion(int id) {
		
		return frmdao.getQuestion(id);
	}

	public void updateQuestion(Forum question) {
		frmdao.updateQuestion(question);
		
	}

}
