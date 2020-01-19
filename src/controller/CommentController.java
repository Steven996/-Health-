package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.ueditor.ActionEnter;

import po.Comment;
import po.Commodity;
import service.CommentService;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	//显示
	@RequestMapping(value = "/comment/comshow.action")
	public String show(Model model){
		List<Comment> comlist = commentService.comshow();
		model.addAttribute("comlist", comlist);
		System.out.println(comlist);
		return "comshow";
	}
	//健康广场评论显示
	@RequestMapping(value = "/comment/customercomshow.action")
	public String customercomshow(Model model){
		List<Comment> comlist = commentService.comshow();
		model.addAttribute("comlist", comlist);
		System.out.println(comlist);
		return "healthsquare";
	}
	//跳转发表评论
	@RequestMapping(value = "/publishComment.action")
	public String publishComment(){
		System.out.println("我来了");
		return "publishComment";
	}
	//跳转登录页面
	@RequestMapping(value = "/customerlogin.action")
	public String customerlogin(){
		
		return "customerlogin";
	}
	
	@RequestMapping(value = "/comment/comdel.action")
	@ResponseBody
	public String delm(int comment_id) {
		int row = commentService.comdel(comment_id);
		if(row > 0) {
			return "OK";
		}
		else {
			return "FAIL";
		}
	}
}
