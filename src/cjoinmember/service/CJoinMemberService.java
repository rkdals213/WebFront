package cjoinmember.service;

import cjoinmember.dto.SsafyMember2DTO;

public interface CJoinMemberService {

	public int joinMember(SsafyMember2DTO dto) throws Exception;

	public SsafyMember2DTO login(SsafyMember2DTO dto) throws Exception;

}
