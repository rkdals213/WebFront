package eboard.service;

import java.util.ArrayList;

import eboard.dao.BoardDAO;
import eboard.dao.BoardDAOImpl;
import eboard.dto.EBoardDTO;

public class EBoardServiceImpl implements EBoardService {

	private BoardDAO dao;

	public EBoardServiceImpl() {
		dao = new BoardDAOImpl();
	}

	@Override
	public int brdRegist(EBoardDTO dto) throws Exception {
		int successCnt = 0;
		successCnt = dao.brdRegist(dto);
		return successCnt;
	}

	@Override
	public ArrayList<EBoardDTO> brdList() throws Exception {
		ArrayList<EBoardDTO> list = new ArrayList<EBoardDTO>();
		list = dao.brdList();
		return list;
	}

	@Override
	public EBoardDTO brdDetail(String articleno) throws Exception {
		EBoardDTO dto = dao.brdDetail(articleno);
		return dto;
	}

	@Override
	public int brdModify(EBoardDTO dto) throws Exception {
		int successCnt = 0;
		successCnt = dao.brdModify(dto);
		return successCnt;
	}

	@Override
	public int brdDelete(String articleno) throws Exception {
		int successCnt = 0;
		successCnt = dao.brdDelete(articleno);
		return successCnt;
	}

}//class
