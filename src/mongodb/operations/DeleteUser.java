package mongodb.operations;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.MongoClient;

import mongodb.dao.UserDAO;
import mongodb.model.User;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String id = request.getParameter("id");
	        if (id == null || "".equals(id)) {
	            throw new ServletException("id missing for delete operation");
	        }
	        MongoClient mongo = (MongoClient) request.getServletContext()
	                .getAttribute("MONGO_CLIENT");
	        UserDAO userDAO = new UserDAO(mongo);
	        User u = new User();
	        u.setId(id);
	        userDAO.deleteUser(u);
	        System.out.println("User deleted successfully with id=" + id);
	        request.setAttribute("success", "User deleted successfully");
	        List<User> users = userDAO.readAllUsers();
	        request.setAttribute("users", users);
	 
	        RequestDispatcher reqDes = getServletContext().getRequestDispatcher(
	                "/users.jsp");
	        reqDes.forward(request, response);
	}

	

}
