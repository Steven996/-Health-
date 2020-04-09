package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import po.Comment;
import po.Customer;
import po.User;
@Service("userService")
@Transactional
public class UserServiceImp implements UserService{
	@Autowired UserDao userDao;
	/*ͨ���˺ź������ѯ�û�*/
	public User findUser(String username,String password) {
		User user = this.userDao.findUser(username, password);
		System.out.println(user);
		return user;
	}
	/*��ʾ�û��б�*/
	public List<Customer> showUser(){
		List<Customer> list = userDao.showUser();
		return list;
	}
	//ɾ���û�
	public int deleteUser(Integer customer_id) {
		return userDao.deleteUser(customer_id);
	}
	//ͨ��id��ȡ�û���Ϣ
	public Customer getUserById(Integer customer_id) {
		return userDao.getUserById(customer_id);
	}
	//�޸��û�
	public int updateUser(Customer customer) {
		return userDao.updateUser(customer);
	}
	//����û�
	public int add(Customer customer) {
		return userDao.add(customer);
	}
	//����
	public List serachUser(@Param(value="customer_name")String customer_name){
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
	public int addbmi(@Param(value="customer_bmi")String customer_bmi,@Param(value="customer_id")int customer_id) {
		// TODO Auto-generated method stub
		return userDao.addbmi(customer_bmi, customer_id);
	}
	
	public int bbs(Comment comment) {
		return userDao.bbs(comment);
	}

	

}
