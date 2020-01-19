package dao;

import java.util.List;

import po.Comment;

public interface CommentDao {
	public List<Comment> comshow();
	public int comdel(int comment_id);
}
