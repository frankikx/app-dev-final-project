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
import java.sql.ResultSet;

@WebServlet("/course-delete")
public class CourseDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");

        String sql = "update courses set status=? where id=?";

        Connection con = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, "0");
            preparedStatement.setString(2, courseId);
            preparedStatement.executeUpdate();

            CommonFunctions.dispatchWithNotif("course-list.jsp?prompt=deleteCourseSuccess", "Course Successfully Deleted", "You can now see the remaining courses.", request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("course-list.jsp?prompt=deleteCourseFailure", "Course Deletion Failed ", e.getMessage(), request, response);
        }
    }
}
