package com.yr.entity;

import java.io.Serializable;

public class UserPojo implements Serializable{// ҵ�������
	private static final long serialVersionUID = 1L;
	private User user;
	private String startBirthday;//��ʼ����
	private String endBirthday;//��������
	private Integer order;//id˳��Ϊ0,id����Ϊ1

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStartBirthday() {
		return startBirthday;
	}

	public void setStartBirthday(String startBirthday) {
		this.startBirthday = startBirthday;
	}

	public String getEndBirthday() {
		return endBirthday;
	}

	public void setEndBirthday(String endBirthday) {
		this.endBirthday = endBirthday;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "UserPojo [user=" + user + ", startBirthday=" + startBirthday + ", endBirthday=" + endBirthday
				+ ", order=" + order + "]";
	}
	
}
