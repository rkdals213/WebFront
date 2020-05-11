package bidcheck.service;

import bidcheck.dao.BIdCheckDAO;
import bidcheck.dao.BIdCheckDAOImpl;

public class BIdCheckServiceImpl implements BIdCheckService {

	private BIdCheckDAO dao;

	public BIdCheckServiceImpl() {
		dao = new BIdCheckDAOImpl();
	}

	@Override
	public int idCheck(String idFromAjax) throws Exception {
		int idCount = 0;
		idCount = dao.idCheck(idFromAjax);
		return idCount;
	}//idCheck

}//class
