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
	//��ʾ
	@RequestMapping(value = "/news/show.action")
		public String newsshow(Model model){
			List<News> newslist = newsService.newsshow();
			model.addAttribute("newslist", newslist);
			System.out.println(newslist);
			return "newsshow";
		}
	//��ҳ������ѯ
	@RequestMapping(value = "/customernews/show.action")
	public String customernews(Model model){
		List<News> newslist = newsService.newsshow();
		model.addAttribute("newslist", newslist);
		System.out.println(newslist);
		return "customerMain";
	}
	//����С����
	@RequestMapping(value = "/news/healthclassshow.action")
	public String healthclassshow(Model model){
		List<News> newslist = newsService.newsshow();
		model.addAttribute("newslist", newslist);
		System.out.println(newslist);
		return "healthclass";
	}
	//���
	@RequestMapping(value = "/news/add.action")
//	@ResponseBody
		public String newsadd(News news,HttpServletRequest request,MultipartFile pictureFile)throws Exception{
				//ʹ��UUID��ͼƬ����������ȥ���ĸ���-��
				String name = UUID.randomUUID().toString().replaceAll("-", "");
				//��ȡ�ļ�����չ��

				String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
				//����ͼƬ�ϴ�·��
			
				String url = request.getSession().getServletContext().getRealPath("/images");
			
				System.out.println(url);
				//�Ծ���·���������������ͼƬ
				pictureFile.transferTo(new File(url+"/"+name + "." + ext));
				//��ͼƬ�洢·�����浽���ݿ�
				news.setNews_pic("images/"+name + "." + ext);
				System.out.println(news);
		int row = newsService.newsadd(news);
			if(row>0) {
				return "redirect:/news/show.action";
			}else {
				return "redirect:/falied.action";
			}
		}
	
	//ɾ��
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
	
	//�޸�
	@RequestMapping(value = "/news/upd.action")
//	@ResponseBody
	public String updm(News news,HttpServletRequest request,MultipartFile pictureFile)throws Exception {
		//ʹ��UUID��ͼƬ����������ȥ���ĸ���-��
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		//��ȡ�ļ�����չ��

		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		//����ͼƬ�ϴ�·��
	
		String url = request.getSession().getServletContext().getRealPath("/images");
	
		System.out.println(url);
		//�Ծ���·���������������ͼƬ
		pictureFile.transferTo(new File(url+"/"+name + "." + ext));
		//��ͼƬ�洢·�����浽���ݿ�
		news.setNews_pic("images/"+name + "." + ext);
		System.out.println(news);
		int rows = newsService.newsupd(news);
		System.out.println(rows);
	    if(rows > 0){
	    	System.out.println("�޸ĳɹ�");
	        return "redirect:/news/show.action";
	    }else{
	    	System.out.println("�޸�ʧ��");
	        return "redirect:/falied.action";
	    }
}
	
	//ͨ��id��ȡ��Ϣ
		@RequestMapping(value = "/news/getNewsById.action")
		@ResponseBody
		public News getMovieById(int news_id) {
			News news = newsService.getNewsById(news_id);
			System.out.println(news);
			return news;
	}
		//��ѯ
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
