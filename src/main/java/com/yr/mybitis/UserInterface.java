package com.yr.mybitis;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yr.entity.Page;
import com.yr.entity.User;
import com.yr.entity.UserPojo;

@Repository("userInterface")
public interface UserInterface {
	
	/**
	 * 查询总条数
	 * @param search
	 * @return Integer
	 */
	Integer getCount(Page<UserPojo> page);//@Param指定的是别名
	
	/**
	 * 分页的形式查询user表的数据
	 * @return List<User>
	 */
	List<UserPojo> query(Page<UserPojo> page); 
	
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
	 * @param id
	 */
	void delete(Integer id);
	
	/**
	 * 根据id查询用户数据
	 * @param id
	 * @return User
	 */
	User getById(Integer id);
}
