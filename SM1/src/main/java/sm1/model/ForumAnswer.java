package sm1.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

@Entity
@Table(name="Forum_Answer")
public class ForumAnswer {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer answer_id;
	private String forum_answer;
	private Date answeredat;
	private String answeredby;
	@ManyToOne
	@JoinColumn(name="forum_id")
	private Forum forum;
	public Integer getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(Integer answer_id) {
		this.answer_id = answer_id;
	}
	public String getForum_answer() {
		return forum_answer;
	}
	public void setForum_answer(String forum_answer) {
		this.forum_answer = forum_answer;
	}
	public Date getAnsweredat() {
		return answeredat;
	}
	public void setAnsweredat(Date answeredat) {
		this.answeredat = answeredat;
	}
	public String getAnsweredby() {
		return answeredby;
	}
	public void setAnsweredby(String answeredby) {
		this.answeredby = answeredby;
	}
	public Forum getForum() {
		return forum;
	}
	public void setForum(Forum forum) {
		this.forum = forum;
	}

}
