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

@WebServlet("/course-upsert")
public class CourseUpsertServlet extends HttpServlet {

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

            CommonFunctions.dispatchWithNotif("course-upsert.jsp?courseId="+courseId, "Show Edit Form Successful", content, request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("course-upsert.jsp?courseId="+courseId+"&prompt=saveCourseFailure", "Show Edit Form Failed: "+courseId, e.getMessage(), request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subj = request.getParameter("inputCourseSubj");
        String content = request.getParameter("inputCourseContent");
        String shortDesc = request.getParameter("inputCourseShortDesc");
        String courseId = request.getParameter("inputHiddenId");

        if(content == "" || subj == "" || shortDesc == ""){
            CommonFunctions.dispatchWithNotif("course-upsert.jsp?prompt=saveCourseFailure", "Course Saving Failed", "Please do not leave any field empty", request, response);
            return;
        }

        if(courseId == "" || courseId == null || courseId == "null" || courseId.equals("null")){
            insertCourse(subj, content, request, response);
        } else {
            updateCourse(courseId, subj, content, shortDesc, request, response);
        }


    }

    private void updateCourse(String courseId, String subject, String content, String shortDesc, HttpServletRequest request, HttpServletResponse response) {
        String sql = "update courses set subject=?,short_desc=?,contents=?,status=? where id=?";

        Connection con = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, subject);
            preparedStatement.setString(2, shortDesc);
            preparedStatement.setString(3, content);
            preparedStatement.setString(4, "1");
            preparedStatement.setString(5, courseId);
            preparedStatement.executeUpdate();

            request.setAttribute("onLoadSubject", subject);
            request.setAttribute("onLoadContent", content);
            request.setAttribute("onLoadShortDesc", shortDesc);

            CommonFunctions.dispatchWithNotif("course-upsert.jsp?courseId="+courseId+"&prompt=saveCourseSuccess", "Course Successfully Updated", "You can now see the latest version on the course list.", request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("course-upsert.jsp?courseId="+courseId+"&prompt=saveCourseFailure", "Course Modify Failed: "+courseId, e.getMessage(), request, response);
        }


    }

    private void insertCourse(String subj, String content, HttpServletRequest request, HttpServletResponse response) {
        String sql = "insert into courses (subject,short_desc,contents,status)values(?,?,?,?)";

        Connection con = null;
        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, subj);
            preparedStatement.setString(2, content);
            preparedStatement.setString(3, content);
            preparedStatement.setString(4, "1");
            preparedStatement.executeUpdate();

            CommonFunctions.dispatchWithNotif("course-list.jsp?prompt=saveCourseSuccess", "Course Successfully Created", "You can now check this out on the course list.", request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("course-list.jsp?prompt=saveCourseFailure", "Course Creation Failed", e.getMessage(), request, response);
        }
    }
}
