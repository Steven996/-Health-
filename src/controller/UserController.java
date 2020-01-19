package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Customer;
import po.User;
import service.UserService;

@Controller
public class UserController {
	@Autowired
		private UserService userService;
	/**
	 * 用户登录
	 * 			**/
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username,String password, Model model, 
                                                          HttpSession session) {
		// 通过账号和密码查询用户
		User user = userService.findUser(username, password);
		if(user != null){		
//			 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页面
			return "redirect:/movie/showMovieType.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
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
	//客户登录
	@RequestMapping(value = "/customerlogin.action", method = RequestMethod.POST)
	public String customerlogin(String customer_name,String customer_pass, Model model, 
                                                          HttpSession session) {
		// 通过账号和密码查询用户
		Customer customer = userService.findCustomer(customer_name, customer_pass);
		if(customer != null){		
//			 将用户对象添加到Session
			session.setAttribute("CUSTOMER_SESSION", customer);
			// 跳转到主页面
			return "redirect:/customer/main.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
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
	//数据分析
	@RequestMapping(value = "/user/datalist.action")
	public String data(){
		return "dataview";
	}
	//增加用户
	@RequestMapping("/user/add.action")
	@ResponseBody
	public String add(Customer customer,HttpSession session) {
	    // 执行Service层中的创建方法，返回的是受影响的行数
		System.out.println("添加");
	    int rows = userService.add(customer);
	    System.out.println("已添加");
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
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
		@RequestMapping("/user/upd.action")
		@ResponseBody
		public String updateUser(Customer customer) {

		    // 执行Service层中的创建方法，返回的是受影响的行数
		    int rows = userService.updateUser(customer);
		  
		    if(rows > 0){
		    	
		    	System.out.println("用户修改成功");
		        return "OK";
		    }else{
		    	
		    	System.out.println(rows);
		    	System.out.println("用户修改失败");
		        return "FAIL";
		    }
		}
	//搜索
		@RequestMapping("/user/serachUser.action")
		public String serachUser(String customer_name,Model model) {
			List searchUserlist = userService.serachUser(customer_name);
			if(searchUserlist.isEmpty()) {
				return "false2";
			
			}else {
				model.addAttribute("searchUserlist", searchUserlist);
				return "serachUserView";
			}
		}
		
		//add  bmi
		@RequestMapping("/user/addbmi.action")
		@ResponseBody
		public String addbmi(Customer customer,HttpSession session) {
		    // 执行Service层中的创建方法，返回的是受影响的行数
			System.out.println("添加");
			System.out.println(customer);
		    int rows = userService.addbmi(customer);
		    System.out.println("已添加");
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}
}
