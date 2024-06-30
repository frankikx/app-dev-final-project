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

@WebServlet("/course-view")
public class CourseViewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");

        String sql = "select * from courses where id=?";

        Connection con = null;
        ResultSet resultSet = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, courseId);
            resultSet = preparedStatement.executeQuery();

            String subject = "";
            String content = "";
            String shortDesc = "";

            if(resultSet.next()){
                subject = resultSet.getString("subject");
                content = resultSet.getString("contents");
                shortDesc = resultSet.getString("short_desc");
            }

            request.setAttribute("onLoadSubject", subject);
            request.setAttribute("onLoadContent", content);
            request.setAttribute("onLoadShortDesc", shortDesc);

            CommonFunctions.dispatchWithNotif("course-view.jsp?courseId="+courseId, "Show Edit Form Successful", content, request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("course-view.jsp?courseId="+courseId+"&prompt=saveCourseFailure", "Show Edit Form Failed: "+courseId, e.getMessage(), request, response);
        }
    }
}
