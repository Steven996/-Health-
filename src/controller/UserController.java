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
	 * �û���¼
	 * 			**/
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username,String password, Model model, 
                                                          HttpSession session) {
		// ͨ���˺ź������ѯ�û�
		User user = userService.findUser(username, password);
		if(user != null){		
//			 ���û�������ӵ�Session
			session.setAttribute("USER_SESSION", user);
			// ��ת����ҳ��
			return "redirect:/movie/showMovieType.action";
		}
		model.addAttribute("msg", "�˺Ż�����������������룡");
         // ���ص���¼ҳ��
		return "login";
	}
	
	@RequestMapping(value = "/customer/main.action", method = RequestMethod.GET)
	public String mainshow() {
		return "customerMain";
	}

	/**
	 * �˳���¼
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // ���Session
	    session.invalidate();
	    // �ض��򵽵�¼ҳ�����ת����
	    return "redirect:login.action";
	}
	/**
	 * ���û���½ҳ����ת
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	//�ͻ���¼
	@RequestMapping(value = "/customerlogin.action", method = RequestMethod.POST)
	public String customerlogin(String customer_name,String customer_pass, Model model, 
                                                          HttpSession session) {
		// ͨ���˺ź������ѯ�û�
		Customer customer = userService.findCustomer(customer_name, customer_pass);
		if(customer != null){		
//			 ���û�������ӵ�Session
			session.setAttribute("CUSTOMER_SESSION", customer);
			// ��ת����ҳ��
			return "redirect:/customer/main.action";
		}
		model.addAttribute("msg", "�˺Ż�����������������룡");
         // ���ص���¼ҳ��
		return "customerlogin";
	}
	//��ʾ�û�
	@RequestMapping(value = "/user/list.action")
	public String userlist(Model model){
		List<Customer> customerlist = userService.showUser();
		model.addAttribute("customerlist",customerlist);
		System.out.println(customerlist);
		return "usershow";
	}
	//���ݷ���
	@RequestMapping(value = "/user/datalist.action")
	public String data(){
		return "dataview";
	}
	//�����û�
	@RequestMapping("/user/add.action")
	@ResponseBody
	public String add(Customer customer,HttpSession session) {
	    // ִ��Service���еĴ������������ص�����Ӱ�������
		System.out.println("���");
	    int rows = userService.add(customer);
	    System.out.println("�����");
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	//ɾ���û�
	@RequestMapping("/user/del.action")
	@ResponseBody
	public String delete(Integer customer_id) {
	    // ִ��Service���еĴ������������ص�����Ӱ�������
	    int rows = userService.deleteUser(customer_id);
	    if(rows > 0){
	    	System.out.println("YES");
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	/**
	 * ͨ��id��ȡ�û���Ϣ
	 */
	@RequestMapping("/user/getUserById.action")
	@ResponseBody
	public Customer getUserById(Integer customer_id) {
		 
		Customer customer = userService.getUserById(customer_id);
		System.out.println(customer);
	    return customer;
	}
	//�޸��û�
		@RequestMapping("/user/upd.action")
		@ResponseBody
		public String updateUser(Customer customer) {

		    // ִ��Service���еĴ������������ص�����Ӱ�������
		    int rows = userService.updateUser(customer);
		  
		    if(rows > 0){
		    	
		    	System.out.println("�û��޸ĳɹ�");
		        return "OK";
		    }else{
		    	
		    	System.out.println(rows);
		    	System.out.println("�û��޸�ʧ��");
		        return "FAIL";
		    }
		}
	//����
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
		    // ִ��Service���еĴ������������ص�����Ӱ�������
			System.out.println("���");
			System.out.println(customer);
		    int rows = userService.addbmi(customer);
		    System.out.println("�����");
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}
}
