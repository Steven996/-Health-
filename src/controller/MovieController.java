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
	
	//小知识
	@RequestMapping(value = "/movie/getclassById.action")

	public String getclassById(Integer news_id,Model model) {
		News news = movieService.getclassById(news_id);
		System.out.println(news);
		model.addAttribute(news);
		return "classdetail";
	}
	//显示电影列表
	@RequestMapping(value = "/movie/show.action")
		public String show(Model model){
			List<Commodity> movielist = movieService.show();
			model.addAttribute("movielist", movielist);
//			System.out.println(movielist);
			return "movieshow";
		}
	//健康之家
	@RequestMapping(value = "/movie/healthhomeshow.action")
		public String healthhomeshow(Model model){
			List<Commodity> movielist = movieService.show();
			model.addAttribute("movielist", movielist);
//			System.out.println(movielist);
			return "healthhome";
		}
	//添加电影
	@RequestMapping(value = "/movie/add.action")
	@ResponseBody
		public String addm(@RequestParam(value = "picture") MultipartFile picture,Model model,Commodity commodity,HttpSession session) throws Exception{
		String realPath=session.getServletContext().getRealPath("/images");
		System.out.println(realPath);
		int index = picture.getOriginalFilename().lastIndexOf(".");//拿到文件后缀名
		String suffix = picture.getOriginalFilename().substring(index+1);//从.后面截取后缀名
		String fileName = realPath+File.separator+"."+suffix;
		model.addAttribute("pictureName", picture.getOriginalFilename());
		picture.transferTo(new File(realPath, picture.getOriginalFilename()));
		
		System.out.println(fileName);
		
		try {
			picture.transferTo(new File(fileName));//上传，到此步上传结束
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
	
	
	
	//商品详情
//	@RequestMapping(value = "/movie/detail.action")
//	public String detail(Model model){
//		Commodity commodity = movieService.detailshow();
//		model.addAttribute("commodity", commodity);
//		return "detail";
//	}
	
	
	
	//删除电影
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
	
	//修改电影
	@RequestMapping(value = "/movie/upd.action")
	@ResponseBody
		public String updm(Commodity commodity) {
		System.out.println(commodity);
		int rows = movieService.updm(commodity);
		 System.out.println(rows);
		 
	    if(rows > 0){
	    	System.out.println("电影修改成功");
	        return "OK";
	    }else{
	    	System.out.println("电影修改失败");
	        return "FAIL";
	    }
	}
	//修改的id
	@RequestMapping(value = "/movie/getMovieByIds.action")

	public Commodity getMovieByIds(Integer commodity_id) {
		Commodity commodity = movieService.getMovieById(commodity_id);
		System.out.println(commodity);
		System.out.println("www");
		return commodity;
	}
	//通过id获取电影信息
	@RequestMapping(value = "/movie/getMovieById.action")

		public String getMovieById(Integer commodity_id,Model model) {
			Commodity commodity = movieService.getMovieById(commodity_id);
			System.out.println("w");
			System.out.println(commodity);
			model.addAttribute(commodity);
			return "detail";
		}
	//pc端通过id获取电影信息
		@RequestMapping(value = "/movie/getMovieByIdpc.action")

			public String getMovieByIdpc(Integer commodity_id,Model model) {
				Commodity commodity = movieService.getMovieById(commodity_id);
				System.out.println(commodity);
				System.out.println("s");
				model.addAttribute(commodity);
				return "detailpc";
			}
	//搜索
	@RequestMapping(value="/movie/search.action")
		public String search(String commodity_name,Model model) {
			List searchlist = movieService.search(commodity_name);
			if(searchlist.isEmpty()) {
				return "false";
			}else {
				System.out.println("搜索的"+commodity_name);
				System.out.println("搜索结果为："+searchlist);
				model.addAttribute("searchlist",searchlist);
				return "searchView";
				
			}
			
		}
//客户端搜索
	@RequestMapping(value="/movie/customersearch.action")
	public String customersearch(String commodity_name,Model model) {
		List searchlist = movieService.search(commodity_name);
		if(searchlist.isEmpty()) {
			return "false";
		}else {
			System.out.println("搜索的"+commodity_name);
			System.out.println("搜索结果为："+searchlist);
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
						//电影分类操作
	
	//显示电影类别列表
	@RequestMapping(value = "/movie/showMovieType.action")
		public String showMovieType(Model model) {
			List<CommodityType> movietypelist = movieService.showtype();
			System.out.println(movietypelist);
			model.addAttribute("movietypelist", movietypelist);
			return "movieshowType";
		}
	
	//添加电影类别
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
	
	//删除电影分类
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
	
	//修改电影分类
	@RequestMapping(value = "/movie/updtype.action")
	@ResponseBody
		public String updtype(CommodityType commodityType) {
		int rows = movieService.updtype(commodityType);
		
		System.out.println(rows);
	    if(rows > 0){
	    	System.out.println("电影分类修改成功");
	        return "OK";
	    }else{
	    	System.out.println("电影分类修改失败");
	        return "FAIL";
	    }
	}
	
	//通过id获取电影分类信息
	@RequestMapping(value = "/movie/getMovieTypeById.action")
	@ResponseBody
		public CommodityType getMovieTypeById(int commodity_type_id) {
			CommodityType movie = movieService.getMovieTypeById(commodity_type_id);
			System.out.println(movie);
			return movie;
		}
}
