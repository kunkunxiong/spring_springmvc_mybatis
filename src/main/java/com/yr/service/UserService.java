package com.yr.service;

import org.springframework.stereotype.Service;

import com.yr.entity.Page;
import com.yr.entity.User;
import com.yr.entity.UserPojo;

@Service
public interface UserService {

	/**
	 * 分页的形式查询user表的数据
	 * @param page
	 */
	void query(Page<UserPojo> page);
	
	/**
	 * 添加用户信息
	 * @param user
	 */
	void add(User user);
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	void update(User user);
	
	/**
	 * 删除用户信息
	 * @param user
	 */
	void delete(Integer id);
	
	/**
	 * 根据id查询用户数据
	 * @param id
	 * @return User
	 */
	User getById(Integer id);
}
