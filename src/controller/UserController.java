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
	 * ����Ա��¼
	 * 			**/
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username,String password,HttpSession session) {
		// ͨ���˺ź������ѯ�û�
		User user = userService.findUser(username, password);
		if(user != null){		
//			 ���û�������ӵ�Session
			session.setAttribute("USER_SESSION", user);
			// ��ת����ҳ��
			return "redirect:/movie/showMovieType.action";
		}else {
		session.setAttribute("msg", "�˺Ż�����������������룡");
         // ���ص���¼ҳ��
		return "login";}
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
	//�û���¼
	@RequestMapping(value = "/customerlogin.action", method = RequestMethod.POST)
	public String customerlogin(String customer_name,String customer_pass,HttpSession session) {
		// ͨ���˺ź������ѯ�û�
		Customer customer = userService.findCustomer(customer_name, customer_pass);
		if(customer != null){		
//			 ���û�������ӵ�Session
			session.setAttribute("CUSTOMER_SESSION", customer);
			// ��ת����ҳ��
			return "redirect:/customer/main.action";
		}
		session.setAttribute("msg", "�˺Ż�����������������룡");
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
	//��ת�û�ע��ҳ��
		@RequestMapping(value="/customer/add.action",method = RequestMethod.GET)
		public String cadd() {
		       return "customerregister";
		}
		
		
	//���ݷ���
	@RequestMapping(value = "/user/datalist.action")
	public String data(){
		return "dataview";
	}
	//������ҳ��ת
	@RequestMapping(value = "/customer/me.action")
	public String findme(){
		return "me";
	}
	//ע��
	@RequestMapping(value="/user/add.action",method= RequestMethod.POST)

	public String add(Customer customer,HttpServletRequest request,MultipartFile pictureFile)throws Exception {
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
				customer.setCustomer_photo("images/"+name + "." + ext);
			
		int rowNo = userService.add(customer);
		System.out.println(rowNo);
		if (rowNo > 0) {
			System.out.println("----------------------�û���ӳɹ���");
			 return "redirect:/customerlogin.action";
		} else {
			System.out.println("----------------------�û����ʧ�ܣ�");
			return "redirect:/falied.action";
		}
 
	}

		
		
		
		
		
//		System.out.println("���");
//	    int rows = userService.add(customer);
//	    System.out.println("�����");
//	    if(rows > 0){
//	        return "OK";
//	    }else{
//	        return "FAIL";
//	    }
//	}

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
		@RequestMapping(value="/user/upd.action",method= RequestMethod.POST)
//		@ResponseBody
		public String updateUser(Customer customer,HttpServletRequest request,MultipartFile pictureFile)throws Exception{
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
			customer.setCustomer_photo("images/"+name + "." + ext);
		    int rows = userService.updateUser(customer);
		  
		    if(rows > 0){
		    	
		    	System.out.println("�û��޸ĳɹ�");
		        return "redirect:/user/list.action";
		    }else{
		    	
		    	System.out.println(rows);
		    	System.out.println("�û��޸�ʧ��");
		        return "redirect:/falied.action";
		    }
		}
	//����
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
		
		//�ϴ�����bmi����
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
		//�����ϴ�����
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
			// �����������ĸ�����ʾ��Ϣ����ת������¼ҳ��
			else if(current_customer == null) {
				request.setAttribute("msg", "����û�е�¼�����ȵ�¼��");
				request.getRequestDispatcher("/WEB-INF/jsp/customerlogin.jsp").forward(request, response);
				
				}
			return false;
//			int customer_id = current_customer.getCustomer_id();
//			System.out.println("�ó������û�id"+customer_id);
//			comment.setCustomer_id(customer_id);
//			System.out.println("�û����ú�id"+comment.getCustomer_id());
//			int rows = userService.bbs(comment);
//			if(rows > 0){
//		        return true;
//		    }else{
//		        return false;
//		    }
		}
}
