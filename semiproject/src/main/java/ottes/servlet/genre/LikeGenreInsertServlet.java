package ottes.servlet.genre;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.GenreDao;
import ottes.beans.GenreDto;

@WebServlet(urlPatterns = "/genre/genre_insert.svt")
public class LikeGenreInsertServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			GenreDto genreDto = new GenreDto();
			
			genreDto.setGenreName(req.getParameter("genreName"));
			
			GenreDao genreDao = new GenreDao();
			genreDao.insert(genreDto);
			
			resp.sendRedirect(req.getContextPath()+ "/client/join_finish.jsp");			
			
		} catch (Exception e) {

		e.printStackTrace();
		resp.sendError(500);
		
		}
	}

}
