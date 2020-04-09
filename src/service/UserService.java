package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import po.Comment;
import po.Customer;
import po.User;

public interface UserService {
	/*通过账号和密码查询用户*/
	public User findUser(@Param("username") String username,
			@Param("password") String password);
	/*显示用户列表*/
	public java.util.List showUser();
	//删除用户
	public int deleteUser(Integer customer_id);
	//通过id获取用户信息
	public Customer getUserById(Integer customer_id);
	//修改用户
	public int updateUser(Customer customer);
	//管理员添加用户
	public int add(Customer customer);
	//查询
	public List serachUser(@Param(value="customer_name")String customer_name);
	
	public int addbmi(@Param(value="customer_bmi")String customer_bmi,@Param(value="customer_id")int customer_id);
	
	public Customer findCustomer(@Param("customer_name") String customer_name,
			@Param("customer_pass") String customer_pass);
	
	public int bbs(Comment comment);
}
