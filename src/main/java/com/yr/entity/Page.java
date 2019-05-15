package com.yr.entity;

import java.util.List;

public class Page<T> {
	private Integer pageNum;// ��ǰ����
	private Integer pageSize;// ����ÿҳ����������
	private Integer totalCount;// ������
	private Integer pageCount;// ��ҳ��
	private List<T> dataList;// �����洢����,���ظ�ҳ��
	private T t;//ʵ����

	// ���������ҳ���鿴����ҳ����������Ҫ�������ʵ��limit�ﵽ��Ч��,limit����Ĳ����ǵ�ǰ�������������������ѯ,����,�ó����ɣ���ǰҳ��-1��*��ǰ����
	public Integer getLimitNum() {
		return (pageNum - 1) * pageSize;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	// ��������������ʱ�������ҳ������
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
		setPageCount(getPageCount());// ������õ���ҳ������
	}

	// ��ҳ����Ҫ���� ��ҳ�� = ������/ÿҳ����
	public Integer getPageCount() {
		pageCount = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;// ��������ȡģÿҳ���������������Ϊ0,����Ϊ0
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	@Override
	public String toString() {
		return "Page [pageNum=" + pageNum + ", pageSize=" + pageSize + ", totalCount=" + totalCount + ", pageCount="
				+ pageCount + ", dataList=" + dataList + ", t=" + t + "]";
	}
	
}