package com.appdevfinalproject.servlets;

import com.appdevfinalproject.common.CommonFunctions;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String lname = request.getParameter("inputLname");
        String fname = request.getParameter("inputFname");
        String mname = request.getParameter("inputMname");
        String homeAddr = request.getParameter("inputHomeAddr");
        String cellNo = request.getParameter("inputCellNo");
        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");
        String passConfirm = request.getParameter("inputPassConfirm");

        CommonFunctions.dispatchWithNotif("login.jsp?prompt=registrationSuccess", "Registration Successful", "You can now login to enroll course.", request, response);

    }
}
