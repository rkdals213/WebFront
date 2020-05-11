package dselectkey.service;

import java.util.ArrayList;

import dselectkey.dao.DSelectKeyDAO;
import dselectkey.dao.DSelectKeyDAOImpl;

public class DSelectKeyServiceImpl implements DSelectKeyService {

	private DSelectKeyDAO dao;

	public DSelectKeyServiceImpl() {
		dao = new DSelectKeyDAOImpl();
	}

	@Override
	public ArrayList<String> makeSearchList(String searchWordFromAjax) throws Exception {
		ArrayList<String> list = new ArrayList<String>();
		list = dao.makeSearchList(searchWordFromAjax);
		return list;
	}

}//class
