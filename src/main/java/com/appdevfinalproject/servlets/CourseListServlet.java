package com.appdevfinalproject.servlets;

import com.appdevfinalproject.common.CommonFunctions;
import com.appdevfinalproject.common.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/course-list")
public class CourseListServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = "select * from courses where status=1";

        Connection con = null;
        ResultSet resultSet = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            request.setAttribute("onLoadCourseList", resultSet);

            CommonFunctions.dispatchWithNotif("course-list.jsp", "Show Edit Form Successful", "", request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("course-upsert.jsp?prompt=showCoursesFailure", "Show Course List Failed: ", e.getMessage(), request, response);
        }
    }
}
