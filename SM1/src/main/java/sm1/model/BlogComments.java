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
@Table(name="Blog_Comments")
public class BlogComments {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer comment_id;
	private String comment;
	private Date commentedAt;
	private String commentedby;
	@ManyToOne
	@JoinColumn(name="blog_id")
	private Blog blog;
	public Integer getComment_id() {
		return comment_id;
	}
	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCommentedAt() {
		return commentedAt;
	}
	public void setCommentedAt(Date commentedAt) {
		this.commentedAt = commentedAt;
	}
	public String getCommentedby() {
		return commentedby;
	}
	public void setCommentedby(String commentedby) {
		this.commentedby = commentedby;
	}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	
	
}
