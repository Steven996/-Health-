package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Commodity;
import po.News;
import service.NewsService;

@Controller
public class NewsController {
@Autowired NewsService newsService;
	//显示
	@RequestMapping(value = "/news/show.action")
		public String newsshow(Model model){
			List<News> newslist = newsService.newsshow();
			model.addAttribute("newslist", newslist);
			System.out.println(newslist);
			return "newsshow";
		}
	//首页健康咨询
	@RequestMapping(value = "/customernews/show.action")
	public String customernews(Model model){
		List<News> newslist = newsService.newsshow();
		model.addAttribute("newslist", newslist);
		System.out.println(newslist);
		return "customerMain";
	}
	//健康小课堂
	@RequestMapping(value = "/news/healthclassshow.action")
	public String healthclassshow(Model model){
		List<News> newslist = newsService.newsshow();
		model.addAttribute("newslist", newslist);
		System.out.println(newslist);
		return "healthclass";
	}
	//添加
	@RequestMapping(value = "/news/add.action")
	@ResponseBody
		public String newsadd(Model model,News news,HttpSession session){
		int row = newsService.newsadd(news);
			if(row>0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}
	
	//删除
	@RequestMapping(value = "/news/del.action")
	@ResponseBody
		public String newsdel(int news_id) {
			int row = newsService.newsdel(news_id);
			if(row > 0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}
	
	//修改
	@RequestMapping(value = "/news/upd.action")
	@ResponseBody
	public String updm(News news) {
		System.out.println(news);
		int rows = newsService.newsupd(news);
		System.out.println(rows);
	    if(rows > 0){
	    	System.out.println("修改成功");
	        return "OK";
	    }else{
	    	System.out.println("修改失败");
	        return "FAIL";
	    }
}
	
	//通过id获取信息
		@RequestMapping(value = "/news/getNewsById.action")
		@ResponseBody
		public News getMovieById(int news_id) {
			News news = newsService.getNewsById(news_id);
			System.out.println(news);
			return news;
	}
	
}
