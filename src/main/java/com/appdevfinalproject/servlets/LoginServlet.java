package com.appdevfinalproject.servlets;

import com.appdevfinalproject.common.CommonFunctions;
import com.appdevfinalproject.common.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");

        loginUser(email,password,request,response);

        //setSampleSessVars(request);
    }

    private void loginUser(String email, String password, HttpServletRequest request, HttpServletResponse response) {

        String sql = "select * from users where email=? and password=?";

        Connection con = null;
        ResultSet resultSet = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            String fname = "";
            String lname = "";
            String usertype = "";
            String userId = "";

            if(resultSet.next()){
                fname = resultSet.getString("fname");
                lname = resultSet.getString("lname");
                usertype = resultSet.getString("user_type");
                userId = resultSet.getString("id");
                HttpSession sess = request.getSession();
                sess.setAttribute("email", email);

                sess.setAttribute("userType", usertype);
                sess.setAttribute("fname", fname);
                sess.setAttribute("lname", lname);
                sess.setAttribute("userId", userId);
                //response.sendRedirect("index.jsp");
                CommonFunctions.dispatchWithNotif("index.jsp?prompt=success", "Successfully log in", "You can now enroll courses", request, response);
            } else {
                CommonFunctions.dispatchWithNotif("login.jsp?prompt=error", "Log in Failed", "Email or password is invalid", request, response);
            }


        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("login.jsp?prompt=error","Log in Failure", e.getMessage(), request, response);
        }
    }


    private void setSampleSessVars(HttpServletRequest request) {
        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");
        HttpSession sess = request.getSession();
        sess.setAttribute("email", email);

        if(email.equals("student@ptc.com")){
            sess.setAttribute("userType", "Student");
        }
        if(email.equals("admin@ptc.com")){
            sess.setAttribute("userType", "Admin");
        }

        sess.setAttribute("fname", "Francis");
        sess.setAttribute("lname", "Santos");
    }
}