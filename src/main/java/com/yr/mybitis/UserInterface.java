package com.yr.mybitis;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yr.entity.Page;
import com.yr.entity.User;
import com.yr.entity.UserPojo;

@Repository("userInterface")
public interface UserInterface {
	
	/**
	 * ��ѯ������
	 * @param search
	 * @return Integer
	 */
	Integer getCount(Page<UserPojo> page);//@Paramָ�����Ǳ���
	
	/**
	 * ��ҳ����ʽ��ѯuser�������
	 * @return List<User>
	 */
	List<UserPojo> query(Page<UserPojo> page); 
	
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
	 * @param id
	 */
	void delete(Integer id);
	
	/**
	 * ����id��ѯ�û�����
	 * @param id
	 * @return User
	 */
	User getById(Integer id);
}
