package com.cms.dto;

import java.lang.reflect.ParameterizedType;
import java.util.LinkedList;
import java.util.List;

import com.cms.model.Channel;

public class TreeDto<T> implements Comparable<T>{

	private T parent;
	private List<T> childs = new LinkedList<T>();

	public T getParent() {
		return parent;
	}
 
	public void setParent(T parent) {
		this.parent = parent;
	}

	public List<T> getChilds() {
		return childs;
	}

	public String toString() {
		return "TreeDto [parent=" + parent + ", childs=" + childs + "]";
	}

	@Override
	public int compareTo(T o) {
		
		try {
			@SuppressWarnings("unchecked")
			Channel parent0 =((Class<Channel>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[0]).newInstance();
			Channel parent1 = (Channel) o.getClass().newInstance();
			
			return parent0.getSort() - parent1.getSort();
		} catch (Exception e) {
		}
		
		return 0;
	}


	
}
