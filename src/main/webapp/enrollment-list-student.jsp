<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="WEB-INF/layout/head/headcontents.jsp" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.appdevfinalproject.common.DatabaseConnection" %>
    <%
    String userId = (String)session.getAttribute("userId");
    userId = userId != null ? userId : "";

    String sql = "select e.id, c.subject,  s.name status, s.id status_id, e.user_id from enrollments e INNER JOIN statuses s on e.status=s.id inner join courses c on e.course_id = c.id where e.user_id="+userId;

    Connection con = DatabaseConnection.getCon();
    PreparedStatement preparedStatement = con.prepareStatement(sql);
    ResultSet resultSet = preparedStatement.executeQuery();
    %>
</head>

<body>
<%@include file="WEB-INF/layout/body/preloaders.jsp" %>
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
        <%@include file="WEB-INF/layout/body/headerbar.jsp" %>

        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <%@include file="WEB-INF/layout/body/sidebar.jsp" %>

                <div class="pcoded-content">
                    <!-- Page-header start -->
                    <div class="page-header">
                        <div class="page-block">
                            <div class="row align-items-center">
                                <div class="col-md-10">
                                    <div class="page-header-title">
                                        <h5 class="m-b-10">ENROLLMENTS</h5>
                                        <p class="m-b-0">See all your enrolled courses here.</p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Page-header end -->
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <!-- Page-body start -->
                                <div class="page-body">

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Applications</h5>
                                                    <div class="card-header-right">
                                                        <ul class="list-unstyled card-option">
                                                            <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                            <li><i class="fa fa-window-maximize full-card"></i></li>
                                                            <li><i class="fa fa-minus minimize-card"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-block table-border-style">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>Course Applied</th>

                                                                    <th>Status</th>
                                                                </tr>

                                                            </thead>
                                                            <tbody>
                                                            <% while(resultSet.next()){ %>

                                                            <%
                                                            String tdClass = "label-inverse-default";

                                                            if (Integer.valueOf(resultSet.getString(4))==1){
                                                                tdClass = "label-info";
                                                            }

                                                            if (Integer.valueOf(resultSet.getString(4))==2){
                                                                tdClass = "label-inverse-success";
                                                            }

                                                            if (Integer.valueOf(resultSet.getString(4))==3){
                                                                tdClass = "label-inverse-danger";
                                                            }

                                                            if (Integer.valueOf(resultSet.getString(4))==4){
                                                                tdClass = "label-danger";
                                                            }

                                                            if (Integer.valueOf(resultSet.getString(4))==5){
                                                                tdClass = "label-success";
                                                            }
                                                            %>
                                                                <tr>
                                                                    <th scope="row"><%= resultSet.getString(1) %></th>
                                                                    <td><%= resultSet.getString(2) %></td>

                                                                    <td>
                                                                        <div class="label-main">
                                                                            <label class="label <%=tdClass %> "><%= resultSet.getString(3) %></label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                </div>
                                <!-- Page-body end -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main-body end -->
                <div id="styleSelector">

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="WEB-INF/layout/body/footer.jsp" %>

</body>

</html>
