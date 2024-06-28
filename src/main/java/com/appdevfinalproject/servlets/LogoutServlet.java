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

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession sess = request.getSession();
        sess.invalidate();

        CommonFunctions.dispatchWithNotif("login.jsp?prompt=logoutSuccess", "Logging off Successful", "Login to continue.", request, response);
    }
}