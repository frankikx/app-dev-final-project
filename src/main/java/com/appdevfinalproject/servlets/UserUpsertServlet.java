package com.appdevfinalproject.servlets;

import com.appdevfinalproject.common.CommonFunctions;
import com.appdevfinalproject.common.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/register")
public class UserUpsertServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String lname = request.getParameter("inputLname");
        String fname = request.getParameter("inputFname");
        String mname = request.getParameter("inputMname");
        String homeAddr = request.getParameter("inputHomeAddr");
        String cellNo = request.getParameter("inputCellNo");
        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");
        String passConfirm = request.getParameter("inputPassConfirm");

        insertUser(lname,fname,mname,homeAddr,cellNo,email,password,passConfirm,request,response);


        CommonFunctions.dispatchWithNotif("login.jsp?prompt=registrationSuccess", "Registration Successful", "You can now login to enroll course.", request, response);

    }

    private void insertUser(String lname, String fname, String mname, String homeAddr, String cellNo, String email, String password, String passConfirm, HttpServletRequest request, HttpServletResponse response) {
        String sql = "insert into users (lname,fname,mname,home_addr,cell_no,email,password,status,user_type)values(?,?,?,?,?,?,?,?,?)";

        Connection con = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,lname);
            preparedStatement.setString(2,fname);
            preparedStatement.setString(3, mname);
            preparedStatement.setString(4, homeAddr);
            preparedStatement.setString(5, cellNo);
            preparedStatement.setString(6,email);
            preparedStatement.setString(7,password);
            preparedStatement.setString(8, "1");
            preparedStatement.setString(9, "Student");
            preparedStatement.executeUpdate();

            CommonFunctions.dispatchWithNotif("login.jsp?prompt=registerSuccess", "Successfully Registered", "You can now log in.", request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("register.jsp?prompt=registerFailure", "Registration Failed", e.getMessage(), request, response);
        }
    }
}
