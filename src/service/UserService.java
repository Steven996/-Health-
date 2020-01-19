package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import po.Customer;
import po.User;

public interface UserService {
	/*ͨ���˺ź������ѯ�û�*/
	public User findUser(@Param("username") String username,
			@Param("password") String password);
	/*��ʾ�û��б�*/
	public java.util.List showUser();
	//ɾ���û�
	public int deleteUser(Integer customer_id);
	//ͨ��id��ȡ�û���Ϣ
	public Customer getUserById(Integer customer_id);
	//�޸��û�
	public int updateUser(Customer customer);
	//����û�
	public int add(Customer customer);
	//��ѯ
	public List serachUser(String customer_name);
	
	public int addbmi(Customer customer);
	
	public Customer findCustomer(@Param("customer_name") String customer_name,
			@Param("customer_pass") String customer_pass);
	
}
