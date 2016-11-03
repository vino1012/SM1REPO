package sm1.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Forum")
public class Forum {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer forum_id;
	private String subject;
	private String description;
	private Date postedat;
	private String postedBy;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private List<ForumAnswer>answer;
	public Integer getForum_id() {
		return forum_id;
	}
	public void setForum_id(Integer forum_id) {
		this.forum_id = forum_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public Date getPostedat() {
		return postedat;
	}
	public void setPostedat(Date postedat) {
		this.postedat = postedat;
	}
	public String getPostedBy() {
		return postedBy;
	}
	public void setPostedBy(String postedBy) {
		this.postedBy = postedBy;
	}
	public List<ForumAnswer> getAnswer() {
		return answer;
	}
	public void setAnswer(List<ForumAnswer> answer) {
		this.answer = answer;
	}

	

}
