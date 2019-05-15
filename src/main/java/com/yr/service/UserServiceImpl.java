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
	 * 分页的形式查询user表的数据
	 * @param page
	 */
	public void query(Page<UserPojo> page){
		page.setTotalCount(userInterface.getCount(page));//查询总条数加入page中
		List<UserPojo> list = userInterface.query(page);//分页查询的数据
		page.setDataList(list);
	}
	
	/**
	 * 添加用户信息
	 * @param user
	 */
	public void add(User user){
		userInterface.add(user);
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	public void update(User user){
		userInterface.update(user);
	}
	
	/**
	 * 删除用户信息
	 * @param id
	 */
	public void delete(Integer id){
		userInterface.delete(id);
	}
	
	/**
	 * 根据id查询用户数据
	 * @param id
	 * @return User
	 */
	public User getById(Integer id){
		return userInterface.getById(id);
	}
}
