package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import po.Commodity;
import po.CommodityType;
import po.Movie;
import po.News;
import po.User;
import service.MovieService;

@Controller
public class MovieController {
	@Autowired 
	private MovieService movieService;
	
	//С֪ʶ
	@RequestMapping(value = "/movie/getclassById.action")

	public String getclassById(Integer news_id,Model model) {
		News news = movieService.getclassById(news_id);
		System.out.println(news);
		model.addAttribute(news);
		return "classdetail";
	}
	//��ʾ��Ӱ�б�
	@RequestMapping(value = "/movie/show.action")
		public String show(Model model){
			List<Commodity> movielist = movieService.show();
			model.addAttribute("movielist", movielist);
//			System.out.println(movielist);
			return "movieshow";
		}
	//����֮��
	@RequestMapping(value = "/movie/healthhomeshow.action")
		public String healthhomeshow(Model model){
			List<Commodity> movielist = movieService.show();
			model.addAttribute("movielist", movielist);
//			System.out.println(movielist);
			return "healthhome";
		}
	//��ӵ�Ӱ
	@RequestMapping(value = "/movie/add.action")
	@ResponseBody
		public String addm(@RequestParam(value = "picture") MultipartFile picture,Model model,Commodity commodity,HttpSession session) throws Exception{
		String realPath=session.getServletContext().getRealPath("/images");
		System.out.println(realPath);
		int index = picture.getOriginalFilename().lastIndexOf(".");//�õ��ļ���׺��
		String suffix = picture.getOriginalFilename().substring(index+1);//��.�����ȡ��׺��
		String fileName = realPath+File.separator+"."+suffix;
		model.addAttribute("pictureName", picture.getOriginalFilename());
		picture.transferTo(new File(realPath, picture.getOriginalFilename()));
		
		System.out.println(fileName);
		
		try {
			picture.transferTo(new File(fileName));//�ϴ������˲��ϴ�����
		} catch (Exception e) {
			e.printStackTrace();
		} 
		int row = movieService.addm(commodity);
			if(row>0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}
	
	
	
	//��Ʒ����
//	@RequestMapping(value = "/movie/detail.action")
//	public String detail(Model model){
//		Commodity commodity = movieService.detailshow();
//		model.addAttribute("commodity", commodity);
//		return "detail";
//	}
	
	
	
	//ɾ����Ӱ
	@RequestMapping(value = "/movie/del.action")
	@ResponseBody
		public String delm(int commodity_id) {
			int row = movieService.delm(commodity_id);
			
			if(row > 0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}
	
	//�޸ĵ�Ӱ
	@RequestMapping(value = "/movie/upd.action")
	@ResponseBody
		public String updm(Commodity commodity) {
		System.out.println(commodity);
		int rows = movieService.updm(commodity);
		 System.out.println(rows);
		 
	    if(rows > 0){
	    	System.out.println("��Ӱ�޸ĳɹ�");
	        return "OK";
	    }else{
	    	System.out.println("��Ӱ�޸�ʧ��");
	        return "FAIL";
	    }
	}
	//�޸ĵ�id
	@RequestMapping(value = "/movie/getMovieByIds.action")

	public Commodity getMovieByIds(Integer commodity_id) {
		Commodity commodity = movieService.getMovieById(commodity_id);
		System.out.println(commodity);
		System.out.println("www");
		return commodity;
	}
	//ͨ��id��ȡ��Ӱ��Ϣ
	@RequestMapping(value = "/movie/getMovieById.action")

		public String getMovieById(Integer commodity_id,Model model) {
			Commodity commodity = movieService.getMovieById(commodity_id);
			System.out.println("w");
			System.out.println(commodity);
			model.addAttribute(commodity);
			return "detail";
		}
	//pc��ͨ��id��ȡ��Ӱ��Ϣ
		@RequestMapping(value = "/movie/getMovieByIdpc.action")

			public String getMovieByIdpc(Integer commodity_id,Model model) {
				Commodity commodity = movieService.getMovieById(commodity_id);
				System.out.println(commodity);
				System.out.println("s");
				model.addAttribute(commodity);
				return "detailpc";
			}
	//����
	@RequestMapping(value="/movie/search.action")
		public String search(String commodity_name,Model model) {
			List searchlist = movieService.search(commodity_name);
			if(searchlist.isEmpty()) {
				return "false";
			}else {
				System.out.println("������"+commodity_name);
				System.out.println("�������Ϊ��"+searchlist);
				model.addAttribute("searchlist",searchlist);
				return "searchView";
				
			}
			
		}
//�ͻ�������
	@RequestMapping(value="/movie/customersearch.action")
	public String customersearch(String commodity_name,Model model) {
		List searchlist = movieService.search(commodity_name);
		if(searchlist.isEmpty()) {
			return "false";
		}else {
			System.out.println("������"+commodity_name);
			System.out.println("�������Ϊ��"+searchlist);
			model.addAttribute("searchlist",searchlist);
			return "customerSearchView";
			
		}
		
	}
//	@RequestMapping(value="/movie/getVideo.action")
//	public String  getVideo(Model model) {
//		List videolist = movieService.getVideo();
//		System.out.println(videolist);
//		model.addAttribute("videolist", videolist);
//		return "getVideo";
//	}
						//��Ӱ�������
	
	//��ʾ��Ӱ����б�
	@RequestMapping(value = "/movie/showMovieType.action")
		public String showMovieType(Model model) {
			List<CommodityType> movietypelist = movieService.showtype();
			System.out.println(movietypelist);
			model.addAttribute("movietypelist", movietypelist);
			return "movieshowType";
		}
	
	//��ӵ�Ӱ���
	@RequestMapping(value = "/movie/addtype.action")
	@ResponseBody
		public String addtype(CommodityType commodityType,HttpSession session) {
			int row = movieService.addtype(commodityType);
			System.out.println(commodityType);
			System.out.println(row);
			if(row>0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}
	
	//ɾ����Ӱ����
	@RequestMapping(value = "/movie/deltype.action")
	@ResponseBody
		public String deltype(int commodity_type_id) {
			int row = movieService.deltype(commodity_type_id);
			if(row > 0) {
				return "OK";
			}else {
				return "FAIL";
			}
		}
	
	//�޸ĵ�Ӱ����
	@RequestMapping(value = "/movie/updtype.action")
	@ResponseBody
		public String updtype(CommodityType commodityType) {
		int rows = movieService.updtype(commodityType);
		
		System.out.println(rows);
	    if(rows > 0){
	    	System.out.println("��Ӱ�����޸ĳɹ�");
	        return "OK";
	    }else{
	    	System.out.println("��Ӱ�����޸�ʧ��");
	        return "FAIL";
	    }
	}
	
	//ͨ��id��ȡ��Ӱ������Ϣ
	@RequestMapping(value = "/movie/getMovieTypeById.action")
	@ResponseBody
		public CommodityType getMovieTypeById(int commodity_type_id) {
			CommodityType movie = movieService.getMovieTypeById(commodity_type_id);
			System.out.println(movie);
			return movie;
		}
}
