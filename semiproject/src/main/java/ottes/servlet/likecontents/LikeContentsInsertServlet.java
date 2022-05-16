package ottes.servlet.likecontents;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.mapper.Mapper;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import ottes.beans.LikeContentsDao;
import ottes.beans.LikeContentsDto;

@WebServlet("/likecontents/likecontents_insert.svt")
public class LikeContentsInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			LikeContentsDto likeContentsDto = new LikeContentsDto();
			likeContentsDto.setContentsNo(Integer.parseInt(req.getParameter("contentsNo")));
			String clientId =  (String) req.getSession().getAttribute("login");
			likeContentsDto.setClientId(clientId);
			
			LikeContentsDao likeContentsDao = new LikeContentsDao();
			int likeNo = likeContentsDao.getSequence();
			likeContentsDto.setLikeNo(likeNo);
			
			boolean like;
			
			int contentsNo = Integer.parseInt(req.getParameter("contentsNo")); 
			
			if(likeContentsDao.find(clientId, contentsNo) != null) {
				likeContentsDao.delete(clientId, contentsNo);
				like = false;
			}
			else {
				likeContentsDao.insert(likeContentsDto);
				like = true;
			}
			
			int count = likeContentsDao.count(contentsNo);
			
			//사용자에게 JSON 형태로 like와 count를 전송해서 처리하도록 안내
			Map<String, Object> data = new HashMap<>();
			data.put("like", like);
			data.put("count", count);
			
			//jackson 변환
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(data);

			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(jsonString);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
	
	
	}

}
