package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	//显示列表
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
	//添加
	@RequestMapping(value = "/movie/add.action",method= RequestMethod.POST)
//	@ResponseBody
		public String addm(Commodity commodity,HttpServletRequest request,MultipartFile pictureFile) throws Exception{
		System.out.println("我来了");
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
		commodity.setCommodity_picture("images/"+name + "." + ext);
		int row = movieService.addm(commodity);
			if(row>0) {
				return "redirect:/movie/show.action";
			}else {
				return "redirect:/falied.action";
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
//	@ResponseBody
		public String updm(Commodity commodity,HttpServletRequest request,MultipartFile pictureFile)throws Exception {
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
		commodity.setCommodity_picture("images/"+name + "." + ext);
		System.out.println(commodity);
		
		int rows = movieService.updm(commodity);
		 System.out.println(rows);
		 
	    if(rows > 0){
	    	System.out.println("电影修改成功");
	        return "redirect:/movie/show.action";
	    }else{
	    	System.out.println("电影修改失败");
	        return "FAIL";
	    }
	}
	//查询修改的id
	@RequestMapping(value = "/movie/getMovieByIds.action")
	@ResponseBody
	public Commodity getMovieByIds(Integer commodity_id) {
		Commodity commodity = movieService.getMovieById(commodity_id);
		System.out.println(commodity);
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
	@RequestMapping(value="/movie/moviesearch.action")
		public String moviesearch(@Param(value="commodity_name")String commodity_name,Model model) {
			List commodity = movieService.moviesearch(commodity_name);
			System.out.println("我是来他妈查询的");
			System.out.println(commodity);
			if(commodity.isEmpty()) {
				return "false";
			}else {
				model.addAttribute("commodity",commodity);
				return "searchView";
				
			}
			
		}
//客户端搜索
	@RequestMapping(value="/movie/customersearch.action")
	public String customersearch(String commodity_name,Model model) {
		List searchlist = movieService.moviesearch(commodity_name);
		if(searchlist.isEmpty()) {
			return "false2";
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
//	@RequestMapping(value = "/movie/updtype.action")
//	@ResponseBody
//		public String updtype(CommodityType commodityType) {
//		int rows = movieService.updtype(commodityType);
//		
//		System.out.println(rows);
//	    if(rows > 0){
//	    	System.out.println("电影分类修改成功");
//	        return "OK";
//	    }else{
//	    	System.out.println("电影分类修改失败");
//	        return "FAIL";
//	    }
//	}
	
	//通过id获取电影分类信息
	@RequestMapping(value = "/movie/getMovieTypeById.action")
	@ResponseBody
		public CommodityType getMovieTypeById(int commodity_type_id) {
			CommodityType movie = movieService.getMovieTypeById(commodity_type_id);
			System.out.println(movie);
			return movie;
		}
	@RequestMapping(value = "/falied.action",method = RequestMethod.GET)
	public String failed(){
		return "500";
	}
}
