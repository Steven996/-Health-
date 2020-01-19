package service;

import java.util.List;

import po.Comment;

public interface CommentService {
	public List<Comment> comshow();
	public int comdel(int comment_id);
}
