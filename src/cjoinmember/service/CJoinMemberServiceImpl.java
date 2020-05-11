package cjoinmember.service;

import cjoinmember.dao.CJoinMemberDAO;
import cjoinmember.dao.CJoinMemberDAOImpl;
import cjoinmember.dto.SsafyMember2DTO;

public class CJoinMemberServiceImpl implements CJoinMemberService {

	private CJoinMemberDAO dao;

	public CJoinMemberServiceImpl(){
		dao = new CJoinMemberDAOImpl();
	}

	@Override
	public int joinMember(SsafyMember2DTO dto) throws Exception {
		int successCnt = 0;
		successCnt = dao.joinMember(dto);
		return successCnt;
	}

	@Override
	public SsafyMember2DTO login(SsafyMember2DTO dto) throws Exception {
		dto = dao.login(dto);
		return dto;
	}

}
