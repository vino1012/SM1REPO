package sm1.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sm1.dao.ForumAnswerDAOImpl;
import sm1.model.ForumAnswer;

@Service
public class ForumAnswerServiceImpl implements ForumAnswerService{

	@Autowired
	ForumAnswerDAOImpl fadao;
	
	@Transactional
	public void saveAnswer(ForumAnswer fanswer) {
		
		fadao.saveAnswer(fanswer);
	}



}
