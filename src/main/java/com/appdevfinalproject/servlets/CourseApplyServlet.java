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

@WebServlet("/course-apply")
public class CourseApplyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");

        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");

        String sql = "insert into enrollments (course_id, user_id, status) values (?,?,?)";

        Connection con = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, courseId);
            preparedStatement.setString(2, userId);
            preparedStatement.setString(3, "1");
            preparedStatement.executeUpdate();

            CommonFunctions.dispatchWithNotif("enrollment-list-student.jsp?prompt=success", "Course Successfully Applied", "Please wait for approval.", request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("enrollment-list-student.jsp?prompt=failure", "Enrollment Application Failed ", e.getMessage(), request, response);
        }
    }
}
