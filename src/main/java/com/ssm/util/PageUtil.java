package com.ssm.util;

import java.util.ArrayList;
import java.util.List;

public class PageUtil {
	public List getList(List beforList, int page, int pageSize) {
		List afterList = new ArrayList();
		if (beforList.size() - (page - 1) * pageSize > pageSize) {
			for (int i = (page - 1) * pageSize; i < page * pageSize; i++) {

				afterList.add(beforList.get(i));
			}
		} else {
			for (int i = (page - 1) * pageSize; i < beforList.size(); i++) {

				afterList.add(beforList.get(i));
			}
		}
		return afterList;
	}

}
