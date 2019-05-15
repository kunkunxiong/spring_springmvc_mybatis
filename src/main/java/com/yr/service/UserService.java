package com.yr.service;

import org.springframework.stereotype.Service;

import com.yr.entity.Page;
import com.yr.entity.User;
import com.yr.entity.UserPojo;

@Service
public interface UserService {

	/**
	 * ��ҳ����ʽ��ѯuser�������
	 * @param page
	 */
	void query(Page<UserPojo> page);
	
	/**
	 * ����û���Ϣ
	 * @param user
	 */
	void add(User user);
	
	/**
	 * �޸��û���Ϣ
	 * @param user
	 */
	void update(User user);
	
	/**
	 * ɾ���û���Ϣ
	 * @param user
	 */
	void delete(Integer id);
	
	/**
	 * ����id��ѯ�û�����
	 * @param id
	 * @return User
	 */
	User getById(Integer id);
}
