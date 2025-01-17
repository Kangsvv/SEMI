package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardDTO;
import dto.GoodDTO;
import dto.JjimDTO;

public class BoardDAO {

	// 싱글턴
	private static BoardDAO instance = null;

	public synchronized static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	// d.b연결
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	// NEXT SEQ 가져오기(해당 작성글 seq)
	public String getSeqNextVal(String boardOption) throws Exception {
		String boardSeq = "";
		if (boardOption.equals("f")) {// 자유게시판
			boardSeq = "free_board_seq";
		} else if (boardOption.equals("g")) {// 여행후기
			boardSeq = "gallery_board_seq ";
		} else if (boardOption.equals("j")) {// 구인구직
			boardSeq = "job_board_seq";
		} else if (boardOption.equals("r")) {// 맛집
			boardSeq = "restaurant_board_seq";
		} else if (boardOption.equals("h")) {// 숙소리뷰
			boardSeq = "house_board_seq";
		} else if (boardOption.equals("e")) {// 숙소리뷰
			boardSeq = "editor_board_seq ";
		}

		String sql = "select '" + boardOption + "'||" + boardSeq + ".nextval from dual ";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getString(1);
		}
	}

	//게시글 검색
	public List<BoardDTO> search(int cpage, String serchOption, String ccontents , String boardOption) throws Exception {
		// 페이지 당 게시글의 번호 세팅.(한 페이지에 20개의 게시글 씩)
		int start = (cpage-1) * 20 +1;
		int end = cpage * 20;
		
		String sql = "select * from "
								+ "(select row_number() over(order by write_date ) line, row_number() over(order by write_date desc) num, all_board.* "
								+ "from all_board "
								+ "where all_board_seq like '"+boardOption+"%' and "+serchOption+" like '%"+ccontents+"%' order by line desc) "
					+ "where num between ? and ? and editor_type != 'n'";

		System.out.println(sql);
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try (ResultSet rs = pstat.executeQuery();) {
				List<BoardDTO> list = new ArrayList<BoardDTO>();

				while (rs.next()) {
					String seq = rs.getString("all_board_seq");
					String id = rs.getString("id");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int like_count = rs.getInt("jjim_count");
					int jjim_count = rs.getInt("like_count");
					int view_count = rs.getInt("view_count");
					String editor_type = rs.getString("editor_type");
					int line = rs.getInt("line");
					
					BoardDTO dto = new BoardDTO(seq, id, title, contents, write_date, jjim_count, like_count, view_count, editor_type, line);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	
	
	
	
	
	// 삽입
	public int insert(BoardDTO dto) throws Exception {

		String sql = "insert into all_board values(?, ?, ?, ?, default, default, default, default, ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getAll_board_seq());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContents());
			if(dto.getEditor_type() == null) {
				pstat.setString(5, "none");
			}else {
				pstat.setString(5, dto.getEditor_type());
			}
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 게시글 삭제
	public int delete(String seq) throws Exception {

		String sql = "delete from all_board where all_board_seq = ? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//게시글 수정 //dao.modifyPost(new BoardDTO(seq, writer, title, contents, null, 0, 0, 0));
	//update member set phone= ?, email = ? ,zipcode=?,address1=?,address2=?  where id =?
		public int modifyPost(BoardDTO dto) throws Exception{
			String sql = "update all_board set title = ? , contents = ? ,write_date = default where all_board_seq=?" ;
			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
				
				
				pstat.setString(1, dto.getTitle());
				pstat.setString(2, dto.getContents());
				pstat.setString(3, dto.getAll_board_seq());
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}			
		}

	// 게시글 정보 get(고유seq로 검색)
	public BoardDTO selectBySeq(String sseq) throws Exception {
		String sql = "select * from all_board where all_board_seq = ? ";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, sseq);

			try (ResultSet rs = pstat.executeQuery()) {
				rs.next();
				String all_board_seq = rs.getString("all_board_seq");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int like_count = rs.getInt("like_count");
				int jjim_count = rs.getInt("jjim_count");
				int view_count = rs.getInt("view_count");
				String editor_type = rs.getString("editor_type");
				return (new BoardDTO(all_board_seq, id, title, contents, write_date, like_count, jjim_count,
						view_count, editor_type, 0));
			}
		}
	}

	// 좋아요 카운트 upDown
	public int likeCountUpDown(String seq, int upDown) throws Exception {
		String plusMinus = "";
		if (upDown == 1) {// 카운트 증가
			plusMinus = "+";
		} else if (upDown == 0) {// 카운트 감소
			plusMinus = "-";
		}

		String sql = "update all_board set like_count = like_count " + plusMinus + "1 where all_board_seq =? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 찜 카운트 upDown
	public int jjimCountUpDown(String seq, int upDown) throws Exception {
		String plusMinus = "";
		if (upDown == 1) {// 카운트 증가
			plusMinus = "+";
		} else if (upDown == 0) {// 카운트 감소
			plusMinus = "-";
		}
		String sql = "update all_board set jjim_count = jjim_count " + plusMinus + "1 where all_board_seq =? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 좋아요 개수 반환
	public int getLikeCount(String seq) throws Exception {

		String sql = "select like_count from all_board where all_board_seq = ? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, seq);

			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	// 찜 개수 반환
	public int getJjimCount(String seq) throws Exception {

		String sql = "select jjim_count from all_board where all_board_seq = ? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, seq);

			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	
	// 조회수 증가
	public int viewCountUp(String seq) throws Exception {
		String sql = "update all_board set view_count = view_count+1 where all_board_seq =? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	// 게시판 리스트 출력( 단, 공지글 제외)
	public List<BoardDTO> selectAll(String boardOption) throws Exception {
		String sql = "select row_number() over(order by write_date) line, all_board.* "
				+ "from all_board "
				+ "where all_board_seq like '"+boardOption+"%' and editor_type != 'n' order by line desc";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			List<BoardDTO> list = new ArrayList<BoardDTO>();

			while (rs.next()) {
				String all_board_seq = rs.getString("all_board_seq");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int like_count = rs.getInt("like_count");
				int jjim_count = rs.getInt("jjim_count");
				int view_count = rs.getInt("view_count");
				String editor_type = rs.getString("editor_type");
				int line = rs.getInt("line");

				BoardDTO dto = new BoardDTO(all_board_seq, id, title, contents, write_date, like_count, jjim_count, view_count, editor_type, line);
				list.add(dto);
			}
			return list;
		}
	}

	
	// 애디터 추천 게시판 리스트 출력(by editor_type //  단, 공지글 제외)
	public List<BoardDTO> selectByEditorType(String boardOption, String eeditor_type) throws Exception {
		String sql = "select row_number() over(order by write_date ) line, all_board.* "
				+ "from all_board "
				+ "where all_board_seq like '"+boardOption+"%' and editor_type = ? and editor_type != 'n' order by line desc";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, eeditor_type);
			List<BoardDTO> list = new ArrayList<BoardDTO>();

			try(ResultSet rs = pstat.executeQuery();){
				while (rs.next()) {
					String all_board_seq = rs.getString("all_board_seq");
					String id = rs.getString("id");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int like_count = rs.getInt("like_count");
					int jjim_count = rs.getInt("jjim_count");
					int view_count = rs.getInt("view_count");
					String editor_type = rs.getString("editor_type");
					int line = rs.getInt("line");

					BoardDTO dto = new BoardDTO(all_board_seq, id, title, contents, write_date, like_count, jjim_count, view_count, editor_type, line);
					list.add(dto);
				}
				return list;
			}

		}
	}
	
	// 제목 클릭시 게시글 출력 //// 아직 시도 안해봄(조양기)
	public BoardDTO selectBySeq(int cseq) throws Exception {
		String sql = "select * from all_board where all_board_seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, cseq);

			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				String seq = rs.getString("all_board_seq");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int like_count = rs.getInt("like_count");
				int jjim_count = rs.getInt("jjim_count");
				int view_count = rs.getInt("view_count");
				String editor_type = rs.getString("editor_type");
 
				BoardDTO dto = new BoardDTO(seq, id, title, contents, write_date, like_count, jjim_count, view_count, editor_type, 0);
				return dto;
			}
		}
	}

	// DB의 총 record 개수를 알아내기 위한 메소드(  단, 공지글 제외)
	private int getRecordTotalCount(String boardOption) throws Exception {
		String sql = "select count(*) from all_board where all_board_seq like '"+boardOption+"%' and editor_type != 'n'";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1); // count(*)로 전체 record 수가 출력되는데, 1열만 나오기 때문에
		}
	}

	// Page Navigator
	public String getPageNavi(int currentPage, String boardOption) throws Exception {
		
		
		String url = "";
		if (boardOption.equals("f")) {// 자유게시판
		url = "/boardMainView.board?cpage=";
		} else if (boardOption.equals("g")) {// 여행후기
		url = "/galleryMain.board?cpage=";
		} else if (boardOption.equals("j")) {// 구인구직
		url = "/jobMain.board?cpage=";
		} else if (boardOption.equals("r")) {// 맛집
		url = "/foodMain.board?cpage=";
		} else if (boardOption.equals("h")) {// 숙소리뷰
		url = "/houseMain.board?cpage=";
		} else if (boardOption.equals("e")) {// 에디터
		url = "/editorReMain.board?cpage=";
		}
		
		
		int recordTotalCount = this.getRecordTotalCount(boardOption); // 총 게시글의 개수 -> 향후 실제 데이터베이스의 개수를 세어와야함

		int recordCountPerPage = 20; // 한 페이지에 몇 개의 게시글을 보여줄 건지

		int naviCountPerPage = 5; // 한 페이지에 몇 개의 네비를 보여 줄 건지

		int pageTotalCount = 0; // 총 몇 개의 페이지가 필요한가?(우리가 정하는게 아니라 설정한 개수에 맞게 정해저야함)

		// 전체 페이지 수는 총 게시글에서 한 페이지에 보여지는 게시글의 개수를 나눈 값. 근데 나머지가 존재하면, +1 을 해줘야한다.
		if (recordTotalCount % recordCountPerPage > 0) { // 전체 페이지 + 1 해야함(나머지가 존재할 때만)
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		// 현재 페이지가 비정상일 때 처리
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// Page Navigator
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1; // navi 시작의 공식 -> 현재 페이지의 십의 자리만
																						// 구해서 * naviPerPage +1 해주면 된다.
		int endNavi = startNavi + (naviCountPerPage - 1);

		if (endNavi > pageTotalCount) { // 전체 페이지수 보다 endNavi 의 수가 클 수는 없다.
			endNavi = pageTotalCount;
		}
		
		boolean needNext = true;
		boolean needPrev = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (startNavi - 1)
					+ "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<li class='page-item active'><a class= 'page-link' href='"+url+"" + i
						+ "'>" + i + " </a></li>"); // 페이지 당 10개씩 보이도록 해야하기 때문에 현재 페이지를 매개변수로 보냄으로써 페이지 네비를 클릭할 때 어디로
													// 가야하는지 알아야한다.
			} else {
				sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + i + "'>" + i
						+ " </a></li>");
			}
		}

		if (needNext) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (endNavi + 1)
					+ "'> > </a></li>");
		}

		return sb.toString();
	}

	
	//검색 전용 페이징
	public String getPageNavi(int currentPage, String boardOption, String serchOption, String contents) throws Exception {
		String url = "/search.board?boardOption="+boardOption+"&serchOption="+serchOption+"&contents="+contents+"&cpage=";
		
		int recordTotalCount = this.getRecordTotalCount(boardOption); // 총 게시글의 개수 -> 향후 실제 데이터베이스의 개수를 세어와야함

		int recordCountPerPage = 20; // 한 페이지에 몇 개의 게시글을 보여줄 건지

		int naviCountPerPage = 5; // 한 페이지에 몇 개의 네비를 보여 줄 건지

		int pageTotalCount = 0; // 총 몇 개의 페이지가 필요한가?(우리가 정하는게 아니라 설정한 개수에 맞게 정해저야함)

		// 전체 페이지 수는 총 게시글에서 한 페이지에 보여지는 게시글의 개수를 나눈 값. 근데 나머지가 존재하면, +1 을 해줘야한다.
		if (recordTotalCount % recordCountPerPage > 0) { // 전체 페이지 + 1 해야함(나머지가 존재할 때만)
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		// 현재 페이지가 비정상일 때 처리
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// Page Navigator
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1; // navi 시작의 공식 -> 현재 페이지의 십의 자리만
																						// 구해서 * naviPerPage +1 해주면 된다.
		int endNavi = startNavi + (naviCountPerPage - 1);

		if (endNavi > pageTotalCount) { // 전체 페이지수 보다 endNavi 의 수가 클 수는 없다.
			endNavi = pageTotalCount;
		}
		
		boolean needNext = true;
		boolean needPrev = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (startNavi - 1)
					+ "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<li class='page-item active'><a class= 'page-link' href='"+url+"" + i
						+ "'>" + i + " </a></li>"); // 페이지 당 10개씩 보이도록 해야하기 때문에 현재 페이지를 매개변수로 보냄으로써 페이지 네비를 클릭할 때 어디로
													// 가야하는지 알아야한다.
			} else {
				sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + i + "'>" + i
						+ " </a></li>");
			}
		}

		if (needNext) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (endNavi + 1)
					+ "'> > </a></li>");
		}

		return sb.toString();
	}
	
	
	
	
	
	// boradlist에서 보여지는 게시글 개수를 정하기 위한 메소드(  단, 공지글 제외)
	public List<BoardDTO> selectByPage(int cpage,String boardOption) throws Exception {

		// 게시글의 번호를 세팅한다.
		int start = (cpage-1) * 20 +1;
		int end = cpage * 20;

		// 한 페이지에 게시글이 20개씩 보여지도록 하기 위해서 row_number를 활용하는데, 서브 쿼리를 활용해서 select 해준다.
		String sql = "select * from (select row_number() over(order by write_date ) line, row_number() over(order by write_date desc) num, all_board.* "
										+ "from all_board "
										+ "where all_board_seq like '"+boardOption+"%' and editor_type != 'n' order by line desc) "
					+ "where num between ? and ?";
						
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try (ResultSet rs = pstat.executeQuery();) {
				List<BoardDTO> list = new ArrayList<BoardDTO>();

				while (rs.next()) {
					String seq = rs.getString("all_board_seq");
					String id = rs.getString("id");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int like_count = rs.getInt("jjim_count");
					int jjim_count = rs.getInt("like_count");
					int view_count = rs.getInt("view_count");
					String editor_type = rs.getString("editor_type");
					int line = rs.getInt("line");

					BoardDTO dto = new BoardDTO(seq, id, title, contents, write_date, jjim_count, like_count,
							view_count, editor_type, line);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// 화제글 list(좋아요, 조회수 정렬//  단, 공지글 제외)
	public List<BoardDTO> selectByLikeCount(String boardOption) throws Exception {

		int start = 1;
		int end = 5;
					  
		String sql = "select * from (select row_number() over(order by like_count desc, view_count desc) line, all_board.* from all_board where all_board_seq like '"+boardOption+"%' and editor_type != 'n') where line between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try (ResultSet rs = pstat.executeQuery();) {
				List<BoardDTO> list = new ArrayList<BoardDTO>();

				while (rs.next()) {
					String seq = rs.getString("all_board_seq");
					String id = rs.getString("id");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int like_count = rs.getInt("jjim_count");
					int jjim_count = rs.getInt("like_count");
					int view_count = rs.getInt("view_count");
					String editor_type = rs.getString("editor_type");
					int line = rs.getInt("line");
					
					BoardDTO dto = new BoardDTO(seq, id, title, contents, write_date, jjim_count, like_count,
							view_count, editor_type, line);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	
	//각 게시판 별 공지글
	public List<BoardDTO> selectNotice(String boardOption) throws Exception {
		String sql = "select row_number() over(order by write_date ) line, all_board.* "
				+ "from all_board "
				+ "where all_board_seq like '"+boardOption+"%' and editor_type = 'n' order by line desc";
//System.out.println(sql);
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			List<BoardDTO> list = new ArrayList<BoardDTO>();

			while (rs.next()) {
				String all_board_seq = rs.getString("all_board_seq");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int like_count = rs.getInt("like_count");
				int jjim_count = rs.getInt("jjim_count");
				int view_count = rs.getInt("view_count");
				String editor_type = rs.getString("editor_type");
				int line = rs.getInt("line");

				BoardDTO dto = new BoardDTO(all_board_seq, id, title, contents, write_date, like_count, jjim_count, view_count, editor_type, line);
				list.add(dto);
			}
			return list;
		}
	}
	
	
	
	///////////////////////////////////////////관리자////////////////////////////////////////////////////////////////////////
	
	// 모든 게시판 리스트(관리자 전용//단, 공지글 제외)
	public List<BoardDTO> selectAll() throws Exception {
		String sql = "select row_number() over(order by write_date ) line, all_board.* from all_board where editor_type != 'n' order by line desc";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			List<BoardDTO> list = new ArrayList<BoardDTO>();

			while (rs.next()) {
				String all_board_seq = rs.getString("all_board_seq");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int like_count = rs.getInt("like_count");
				int jjim_count = rs.getInt("jjim_count");
				int view_count = rs.getInt("view_count");
				String editor_type = rs.getString("editor_type");
				int line = rs.getInt("line");

				BoardDTO dto = new BoardDTO(all_board_seq, id, title, contents, write_date, like_count, jjim_count, view_count, editor_type, line);
				list.add(dto);
			}
			return list;
		}
	}

	//관리자 게시글 전용 페이징
	public String getAdminPageNavi(int currentPage, String boardOption) throws Exception {

		String url = "/adiminPageTap1.admin?boardOption="+boardOption+"&cpage=";
		
		int recordTotalCount = this.getRecordTotalCount(boardOption); // 총 게시글의 개수 -> 향후 실제 데이터베이스의 개수를 세어와야함

		int recordCountPerPage = 20; // 한 페이지에 몇 개의 게시글을 보여줄 건지

		int naviCountPerPage = 5; // 한 페이지에 몇 개의 네비를 보여 줄 건지

		int pageTotalCount = 0; // 총 몇 개의 페이지가 필요한가?(우리가 정하는게 아니라 설정한 개수에 맞게 정해저야함)

		// 전체 페이지 수는 총 게시글에서 한 페이지에 보여지는 게시글의 개수를 나눈 값. 근데 나머지가 존재하면, +1 을 해줘야한다.
		if (recordTotalCount % recordCountPerPage > 0) { // 전체 페이지 + 1 해야함(나머지가 존재할 때만)
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		// 현재 페이지가 비정상일 때 처리
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// Page Navigator
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1; // navi 시작의 공식 -> 현재 페이지의 십의 자리만
																						// 구해서 * naviPerPage +1 해주면 된다.
		int endNavi = startNavi + (naviCountPerPage - 1);

		if (endNavi > pageTotalCount) { // 전체 페이지수 보다 endNavi 의 수가 클 수는 없다.
			endNavi = pageTotalCount;
		}
		
		boolean needNext = true;
		boolean needPrev = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (startNavi - 1)
					+ "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<li class='page-item active'><a class= 'page-link' href='"+url+"" + i
						+ "'>" + i + " </a></li>"); // 페이지 당 10개씩 보이도록 해야하기 때문에 현재 페이지를 매개변수로 보냄으로써 페이지 네비를 클릭할 때 어디로
													// 가야하는지 알아야한다.
			} else {
				sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + i + "'>" + i
						+ " </a></li>");
			}
		}

		if (needNext) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (endNavi + 1)
					+ "'> > </a></li>");
		}

		return sb.toString();
	
	}
	

	//관리자 게시글 검색 전용 페이징
	public String getAdminSearchPageNavi(int currentPage, String boardOption, String serchOption, String contents) throws Exception {
		String url = "/adiminPageTap1Search.admin?boardOption="+boardOption+"&serchOption="+serchOption+"&contents="+contents+"&cpage=";
		
		int recordTotalCount = this.getRecordTotalCount(boardOption); // 총 게시글의 개수 -> 향후 실제 데이터베이스의 개수를 세어와야함

		int recordCountPerPage = 20; // 한 페이지에 몇 개의 게시글을 보여줄 건지

		int naviCountPerPage = 5; // 한 페이지에 몇 개의 네비를 보여 줄 건지

		int pageTotalCount = 0; // 총 몇 개의 페이지가 필요한가?(우리가 정하는게 아니라 설정한 개수에 맞게 정해저야함)

		// 전체 페이지 수는 총 게시글에서 한 페이지에 보여지는 게시글의 개수를 나눈 값. 근데 나머지가 존재하면, +1 을 해줘야한다.
		if (recordTotalCount % recordCountPerPage > 0) { // 전체 페이지 + 1 해야함(나머지가 존재할 때만)
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		// 현재 페이지가 비정상일 때 처리
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// Page Navigator
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1; // navi 시작의 공식 -> 현재 페이지의 십의 자리만
																						// 구해서 * naviPerPage +1 해주면 된다.
		int endNavi = startNavi + (naviCountPerPage - 1);

		if (endNavi > pageTotalCount) { // 전체 페이지수 보다 endNavi 의 수가 클 수는 없다.
			endNavi = pageTotalCount;
		}
		
		boolean needNext = true;
		boolean needPrev = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (startNavi - 1)
					+ "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (currentPage == i) {
				sb.append("<li class='page-item active'><a class= 'page-link' href='"+url+"" + i
						+ "'>" + i + " </a></li>"); // 페이지 당 10개씩 보이도록 해야하기 때문에 현재 페이지를 매개변수로 보냄으로써 페이지 네비를 클릭할 때 어디로
													// 가야하는지 알아야한다.
			} else {
				sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + i + "'>" + i
						+ " </a></li>");
			}
		}

		if (needNext) {
			sb.append("<li class='page-item'><a class= 'page-link' href='"+url+"" + (endNavi + 1)
					+ "'> > </a></li>");
		}

		return sb.toString();
	}
	
}
