package eboard.service;

import java.util.ArrayList;

import eboard.dto.EBoardDTO;

public interface EBoardService {

	public int brdRegist(EBoardDTO dto) throws Exception;

	public ArrayList<EBoardDTO> brdList() throws Exception;

	public EBoardDTO brdDetail(String articleno) throws Exception;

	public int brdModify(EBoardDTO dto) throws Exception;

	public int brdDelete(String articleno) throws Exception;

}
