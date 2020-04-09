package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import po.Comment;

public interface CommentDao {
	public List<Comment> comshow();
	public int comdel(int comment_id);
	public List serachcom(@Param(value="customer_name") String customer_name);
}
