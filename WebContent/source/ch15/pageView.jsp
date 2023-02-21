<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
	
//1. 틀 >  숫자를 정해줘서 사용이되는 것들
		  //현제 디비에 등록된 전체 게시물수
		  int totalRecord = Integer.parseInt(request.getParameter("totalRecord"));
		  // 페이지당 레코드 수 (게시물 수 )
		  int numPerPage = 10; 
		  //블럭당 페이지수 (페이징버튼 수 15개)
		  int pagePerBlock = 15;  
//2. 계산식을 위한 초기화
	  	int totalPage = 0; //전체 페이지 수
	    int totalBlock = 0;  //전체 블럭수 
//3. 첫 세팅시 디폴트 값 1번 페이지에 1번 블럭
	    int nowPage = 1; // 현재페이지 번호
	    int nowBlock = 1;  //현재블럭 
// 3. 첫 세팅시 디비 검색용 디폴트값  
    int start=0; //디비의 select 시작번호 0 부터
    int end=10; // 마지막 리스트 수 10번 (게시물수) 
   
    int listSize=0; //현재 읽어온 게시물의 수 (ex .10건이 안될수도)
    
    
    
    
  //현제페이지에 개시물수 가  NULL이 아니면 
  //현제페이지의 게시물수를 나타내는 변수에 값을 넣어줄거다.
	  if (request.getParameter("nowPage") != null) {
	    nowPage = Integer.parseInt(request.getParameter("nowPage"));
	  }
    
 
      //디비에서 셀렉트하기 위한 시작번호    = ( 현제 페이지 번호 * 페이징 당 들어갈 수 있는 게시물수 ) - 페이징 당 들어갈 수 있는 게시물수
	  start = (nowPage * numPerPage) - numPerPage;
      // 페이징 당 들어갈 수 있는 게시물수   (마지막 표기해줄  번호)
	  end = numPerPage;

      
	//전체페이지수
		//전체 페이지수  =  ( 전체 디비 /한페이지 당 페이지 수 )
		// 3 페이지 =  11건 / 페이지당 5개 
	  totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
	//현재블럭 계산
		// 현제 블럭은 = 현제 개시글 페이지 번호 / 페이징 버튼수
		//  = 20 / 15
	  nowBlock= (int)Math.ceil((double)nowPage/pagePerBlock);
	 //전체블럭계산
	 
	  totalBlock =(int)Math.ceil((double)totalPage / pagePerBlock);//전체블럭계산
%>
<html>
<head>
<title>페이징 & 블럭 처리 테스트</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(value){
	 	document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
	 	document.readFrm.submit();
	} 
</script>
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br/>
<h2>페이징 & 블럭 처리 테스트</h2>
<br/>
	<table width="600">
			<tr align="center">
				<td><b>Total : <%=totalRecord%>Articles(<font color="red">
				<%=nowPage%>/<%=totalPage%>Pages</font>)</b></td>
			</tr>
	</table>
	<table>
	<tr>
		<td>게시물 번호 : &nbsp;</td>
		<%
			listSize = totalRecord-start;
			for(int i = 0;i<numPerPage; i++){
				if (i == listSize) break;
		%>
		<td align="center">
			<%=totalRecord-((nowPage-1)*numPerPage)-i%>&nbsp;
		</td>
		<%}//for%>
		<td align="center">&nbsp;</td>
	</tr>
</table>
<!-- 페이징 및 블럭 -->
<table>
	<tr>
		<td>
			<!-- 페이징 및 블럭 처리 Start--> 
			<%
   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
   				  //하단 페이지 끝번호
   				  if(totalPage !=0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
							
							<%for ( ; pageStart < pageEnd; pageStart++){%>
     			     			<a href="javascript:pageing('<%=pageStart %>')"> 
     						<%if(pageStart==nowPage) {%><font color="blue"><%}%>
     						[<%=pageStart %>] 
     						<%if(pageStart==nowPage) {%></font> <%}%></a> 
    						<%}//for%>&nbsp; 
    						
    					<%if (totalBlock > nowBlock ) {%>
    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
    				<%}%>&nbsp;  
   				<%}%>
 			<!-- 페이징 및 블럭 처리 End-->
		</td>
	</tr>
</table>
<hr width="600"/>
<form name="readFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
</form>
<b>
totalRecord : <%=totalRecord%>&nbsp;
numPerPage : <%=numPerPage%>&nbsp;
pagePerBlock : <%=pagePerBlock%>&nbsp;
totalPage : <%=totalPage%>&nbsp;<br/>
totalBlock : <%=totalBlock%>&nbsp;
nowPage : <%=nowPage%>&nbsp;
nowBlock : <%=nowBlock%>&nbsp;</b>
<p/>
<input type="button" value="TotalRecord 입력폼" onClick="javascript:location.href='pageView.html'">
</div>
</body>
</html>