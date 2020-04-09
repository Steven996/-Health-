package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import po.Comment;
import po.Customer;
import po.User;
import service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	/**
	 * 管理员登录
	 * 			**/
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username,String password,HttpSession session) {
		// 通过账号和密码查询用户
		User user = userService.findUser(username, password);
		if(user != null){		
//			 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页面
			return "redirect:/movie/showMovieType.action";
		}else {
		session.setAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";}
	}
	
	@RequestMapping(value = "/customer/main.action", method = RequestMethod.GET)
	public String mainshow() {
		return "customerMain";
	}

	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	//用户登录
	@RequestMapping(value = "/customerlogin.action", method = RequestMethod.POST)
	public String customerlogin(String customer_name,String customer_pass,HttpSession session) {
		// 通过账号和密码查询用户
		Customer customer = userService.findCustomer(customer_name, customer_pass);
		if(customer != null){		
//			 将用户对象添加到Session
			session.setAttribute("CUSTOMER_SESSION", customer);
			// 跳转到主页面
			return "redirect:/customer/main.action";
		}
		session.setAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "customerlogin";
	}
	//显示用户
	@RequestMapping(value = "/user/list.action")
	public String userlist(Model model){
		List<Customer> customerlist = userService.showUser();
		model.addAttribute("customerlist",customerlist);
		System.out.println(customerlist);
		return "usershow";
	}
	//跳转用户注册页面
		@RequestMapping(value="/customer/add.action",method = RequestMethod.GET)
		public String cadd() {
		       return "customerregister";
		}
		
		
	//数据分析
	@RequestMapping(value = "/user/datalist.action")
	public String data(){
		return "dataview";
	}
	//个人主页跳转
	@RequestMapping(value = "/customer/me.action")
	public String findme(){
		return "me";
	}
	//注册
	@RequestMapping(value="/user/add.action",method= RequestMethod.POST)

	public String add(Customer customer,HttpServletRequest request,MultipartFile pictureFile)throws Exception {
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
				customer.setCustomer_photo("images/"+name + "." + ext);
			
		int rowNo = userService.add(customer);
		System.out.println(rowNo);
		if (rowNo > 0) {
			System.out.println("----------------------用户添加成功！");
			 return "redirect:/customerlogin.action";
		} else {
			System.out.println("----------------------用户添加失败！");
			return "redirect:/falied.action";
		}
 
	}

		
		
		
		
		
//		System.out.println("添加");
//	    int rows = userService.add(customer);
//	    System.out.println("已添加");
//	    if(rows > 0){
//	        return "OK";
//	    }else{
//	        return "FAIL";
//	    }
//	}

	//删除用户
	@RequestMapping("/user/del.action")
	@ResponseBody
	public String delete(Integer customer_id) {
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = userService.deleteUser(customer_id);
	    if(rows > 0){
	    	System.out.println("YES");
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * 通过id获取用户信息
	 */
	@RequestMapping("/user/getUserById.action")
	@ResponseBody
	public Customer getUserById(Integer customer_id) {
		 
		Customer customer = userService.getUserById(customer_id);
		System.out.println(customer);
	    return customer;
	}
	//修改用户
		@RequestMapping(value="/user/upd.action",method= RequestMethod.POST)
//		@ResponseBody
		public String updateUser(Customer customer,HttpServletRequest request,MultipartFile pictureFile)throws Exception{
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
			customer.setCustomer_photo("images/"+name + "." + ext);
		    int rows = userService.updateUser(customer);
		  
		    if(rows > 0){
		    	
		    	System.out.println("用户修改成功");
		        return "redirect:/user/list.action";
		    }else{
		    	
		    	System.out.println(rows);
		    	System.out.println("用户修改失败");
		        return "redirect:/falied.action";
		    }
		}
	//搜索
		@RequestMapping("/user/serachUser.action")
		public String serachUser(@Param(value="customer_name")String customer_name,Model model) {
			List searchUserlist = userService.serachUser(customer_name);
			if(searchUserlist.isEmpty()) {
				return "false2";
			
			}else {
				model.addAttribute("searchUserlist", searchUserlist);
				return "serachUserView";
			}
		}
		
		//上传个人bmi数据
		@RequestMapping("/user/addbmi.action")
		@ResponseBody
		public String addbmi(HttpServletRequest request){
			HttpSession session = request.getSession();
			String customer_bmi =  (String) session.getAttribute("bmi");
			Customer current_customer = (Customer) session.getAttribute("CUSTOMER_SESSION");
			int current_customer_id = current_customer.getCustomer_id();
		    int rows = userService.addbmi(customer_bmi,current_customer_id);
		    System.out.println(rows);
		    if(rows > 0){
		    	
		        return "OK";
		    }else{
		    
		        return "FAIL";
		    }
		}
		//发表上传评论
		@RequestMapping(value="/user/bbs.action",method= RequestMethod.POST)
		@ResponseBody
		public boolean bbs(Comment comment,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			Customer current_customer = (Customer) session.getAttribute("CUSTOMER_SESSION");
			if (current_customer != null) {
				int customer_id = current_customer.getCustomer_id();
				comment.setCustomer_id(customer_id);
				String bbs = comment.getComment_detail();
			System.out.println(bbs);
				userService.bbs(comment);
				return true;
			}
			// 不符合条件的给出提示信息，并转发到登录页面
			else if(current_customer == null) {
				request.setAttribute("msg", "您还没有登录，请先登录！");
				request.getRequestDispatcher("/WEB-INF/jsp/customerlogin.jsp").forward(request, response);
				
				}
			return false;
//			int customer_id = current_customer.getCustomer_id();
//			System.out.println("拿出来的用户id"+customer_id);
//			comment.setCustomer_id(customer_id);
//			System.out.println("用户设置后id"+comment.getCustomer_id());
//			int rows = userService.bbs(comment);
//			if(rows > 0){
//		        return true;
//		    }else{
//		        return false;
//		    }
		}
}
