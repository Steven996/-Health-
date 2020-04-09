package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.CommentDao;
import po.Comment;
import po.Commodity;
@Service("commentService")
public class CommentServiceImp implements CommentService{
	@Autowired CommentDao commentDao;
	@Override
	public List<Comment> comshow() {
		List<Comment> comlist = commentDao.comshow();
		return comlist;
	}

	@Override
	public int comdel(int comment_id) {
		return commentDao.comdel(comment_id);
	}
	public List serachcom(@Param(value="customer_name")String customer_name) {
		return commentDao.serachcom(customer_name);
	}
}
