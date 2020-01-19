package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import po.Customer;
import po.User;
@Service("userService")
@Transactional
public class UserServiceImp implements UserService{
	@Autowired UserDao userDao;
	/*通过账号和密码查询用户*/
	public User findUser(String username,String password) {
		User user = this.userDao.findUser(username, password);
		System.out.println(user);
		return user;
	}
	/*显示用户列表*/
	public List<Customer> showUser(){
		List<Customer> list = userDao.showUser();
		return list;
	}
	//删除用户
	public int deleteUser(Integer customer_id) {
		return userDao.deleteUser(customer_id);
	}
	//通过id获取用户信息
	public Customer getUserById(Integer customer_id) {
		return userDao.getUserById(customer_id);
	}
	//修改用户
	public int updateUser(Customer customer) {
		return userDao.updateUser(customer);
	}
	//添加用户
	public int add(Customer customer) {
		return userDao.add(customer);
	}
	//搜索
	public List serachUser(String customer_name){
		List customer = userDao.serachUser(customer_name);
		return customer;
	}
	@Override
	public Customer findCustomer(String customer_name, String customer_pass) {
		// TODO Auto-generated method stub
		Customer customer = this.userDao.findCustomer(customer_name, customer_pass);
		System.out.println(customer);
		return customer;
	}
	@Override
	public int addbmi(Customer customer) {
		// TODO Auto-generated method stub
		return userDao.addbmi(customer);
	}
	
	

}
