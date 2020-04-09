package controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
//	@ResponseBody
		public String newsadd(News news,HttpServletRequest request,MultipartFile pictureFile)throws Exception{
				//使用UUID给图片重命名，并去掉四个“-”
				String name = UUID.randomUUID().toString().replaceAll("-", "");
				//获取文件的扩展名

				String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
				//设置图片上传路径
			
				String url = request.getSession().getServletContext().getRealPath("/images");
			
				System.out.println(url);
				//以绝对路径保存重名命后的图片
				pictureFile.transferTo(new File(url+"/"+name + "." + ext));
				//把图片存储路径保存到数据库
				news.setNews_pic("images/"+name + "." + ext);
				System.out.println(news);
		int row = newsService.newsadd(news);
			if(row>0) {
				return "redirect:/news/show.action";
			}else {
				return "redirect:/falied.action";
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
//	@ResponseBody
	public String updm(News news,HttpServletRequest request,MultipartFile pictureFile)throws Exception {
		//使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		//获取文件的扩展名

		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		//设置图片上传路径
	
		String url = request.getSession().getServletContext().getRealPath("/images");
	
		System.out.println(url);
		//以绝对路径保存重名命后的图片
		pictureFile.transferTo(new File(url+"/"+name + "." + ext));
		//把图片存储路径保存到数据库
		news.setNews_pic("images/"+name + "." + ext);
		System.out.println(news);
		int rows = newsService.newsupd(news);
		System.out.println(rows);
	    if(rows > 0){
	    	System.out.println("修改成功");
	        return "redirect:/news/show.action";
	    }else{
	    	System.out.println("修改失败");
	        return "redirect:/falied.action";
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
		//查询
		@RequestMapping(value = "/news/newssearch.action")
		public String newssearch(@Param(value="news_title")String news_title,Model model) {
			List searchnewslist = newsService.newssearch(news_title);
			if(searchnewslist.isEmpty()) {
				return "false3";
			
			}else {
				model.addAttribute("searchnewslist", searchnewslist);
				return "searchNews";
			}
		}
	
}
