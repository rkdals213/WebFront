package aformat.service;

import aformat.dao.AFormatDAO;
import aformat.dao.AFormatDAOImpl;

public class AFormatServiceImpl implements AFormatService {

	private AFormatDAO dao;

	public AFormatServiceImpl() {
		dao = new AFormatDAOImpl();
	}

	@Override
	public int idCheck(String idFromAjax) throws Exception {
		int idCount = 0;
		idCount = dao.idCheck(idFromAjax);
		return idCount;
	}//idCheck

}
