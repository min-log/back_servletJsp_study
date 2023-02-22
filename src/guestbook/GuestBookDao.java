package guestbook;

import java.util.ArrayList;

public interface GuestBookDao {
	//출력
	public ArrayList<GuestBookVo> getlist();
	//저장
	public int insert(GuestBookVo vo);
	//삭재
	public int delete(GuestBookVo vo);
	
	public int update(GuestBookVo vo);
	
	public ArrayList<GuestBookVo> search(GuestBookVo vo);
}
