package com.yr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yr.entity.Page;
import com.yr.entity.User;
import com.yr.entity.UserPojo;
import com.yr.mybitis.UserInterface;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	@Autowired
	@Qualifier("userInterface")
	private UserInterface userInterface;
	
	/**
	 * ��ҳ����ʽ��ѯuser�������
	 * @param page
	 */
	public void query(Page<UserPojo> page){
		page.setTotalCount(userInterface.getCount(page));//��ѯ����������page��
		List<UserPojo> list = userInterface.query(page);//��ҳ��ѯ������
		page.setDataList(list);
	}
	
	/**
	 * ����û���Ϣ
	 * @param user
	 */
	public void add(User user){
		userInterface.add(user);
	}
	
	/**
	 * �޸��û���Ϣ
	 * @param user
	 */
	public void update(User user){
		userInterface.update(user);
	}
	
	/**
	 * ɾ���û���Ϣ
	 * @param id
	 */
	public void delete(Integer id){
		userInterface.delete(id);
	}
	
	/**
	 * ����id��ѯ�û�����
	 * @param id
	 * @return User
	 */
	public User getById(Integer id){
		return userInterface.getById(id);
	}
}
