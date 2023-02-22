package email2;

import java.util.ArrayList;

public class DaoTest {

  public static void main(String[] args) {
    // 전체 목록 조회 
    EmaillistDao dao = new EmaillistDao();
//    ArrayList<EmaillistVo> list = dao.getList();
//    
//    for(EmaillistVo vo : list) {
//      System.out.println(vo);
//    }
    
 // 신규 정보 저장 
//    EmaillistVo vo = new EmaillistVo("Test3333", "Dao333","testdao3333@test3333.com");
//    if(dao.insert(vo)) {
//      System.out.println("데이터 입력 성공");
//    }else{
//      System.out.println("데이터 입력 실패");
//    }
    
 // 정보 삭제 
    EmaillistVo vo = new EmaillistVo();
    vo.setNo(100);
    if(dao.delete(vo)) {
      System.out.println("데이터 삭제 성공");
    }else{
      System.out.println("데이터 삭제 실패");
    }
  }
}
