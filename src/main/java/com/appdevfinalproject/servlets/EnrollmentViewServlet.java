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

@WebServlet("/enrollment-view")
public class EnrollmentViewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String enrollmentId = request.getParameter("enrollmentId");

        String sql = "select e.id, c.subject, c.contents, c.short_desc, u.lname, u.fname, u.mname, u.cell_no, u.email, u.home_addr from enrollments e inner join courses c on e.course_id = c.id inner join users u on e.user_id=u.id where e.id = ?";

        Connection con = null;
        ResultSet resultSet = null;

        try {
            con = DatabaseConnection.getCon();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, enrollmentId);
            resultSet = preparedStatement.executeQuery();

            String subject = "";
            String content = "";
            String shortDesc = "";
            String lname = "";
            String fname = "";
            String mname = "";
            String cellNo = "";
            String email = "" ;
            String homeAddr = "" ;

            if(resultSet.next()){
                subject = resultSet.getString("subject");
                content = resultSet.getString("contents");
                shortDesc = resultSet.getString("short_desc");
                lname =  resultSet.getString("lname");
                fname =  resultSet.getString("fname");
                mname =  resultSet.getString("mname");
                cellNo =  resultSet.getString("cell_no");
                email =  resultSet.getString("email");
                homeAddr =  resultSet.getString("home_addr");
            }

            request.setAttribute("onLoadSubject", subject);
            request.setAttribute("onLoadContent", content);
            request.setAttribute("onLoadShortDesc", shortDesc);
            request.setAttribute("onLoadLname", lname);
            request.setAttribute("onLoadFname", fname);
            request.setAttribute("onLoadMname", mname);
            request.setAttribute("onLoadCellNo", cellNo);
            request.setAttribute("onLoadEmail", email);
            request.setAttribute("onLoadhomeAddr", homeAddr);



            CommonFunctions.dispatchWithNotif("enrollment-view.jsp?enrollmentId="+enrollmentId, "Show Enrollment Process Form Successful", "", request, response);

        } catch (Exception e) {

            CommonFunctions.dispatchWithNotif("enrollment-view.jsp?enrollmentId="+enrollmentId+"&prompt=processEnrollmentFailure", "Show Enrollment Process Form Failure: ", e.getMessage(), request, response);
        }
    }
}
