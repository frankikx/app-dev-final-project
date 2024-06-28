<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="WEB-INF/layout/head/headcontents.jsp" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.appdevfinalproject.common.DatabaseConnection" %>

    <%
    String sql = "select * from courses where status=1";

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
                                        <h5 class="m-b-10">OFFERED PROGRAMS</h5>
                                        <p class="m-b-0">Welcome to Pateros Technological College. Start your journey to become a globally competitive professional.</p>
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
                                <% while(resultSet.next()){ %>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <!-- Typography card start -->
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5><%= resultSet.getString(2) %></h5>
                                                </div>
                                                <div class="card-block typography">
                                                    <%= resultSet.getString(3) != null ? resultSet.getString(3) : "No Short Description here" %>
                                                    <br/><br/>
                                                    <a href="course-view?courseId=<%= resultSet.getString(1) %>" class="btn btn-mat waves-effect waves-light btn-success">Read more</a>
                                                </div>

                                            </div>
                                            <!-- Typography card end -->
                                        </div>
                                    </div>
                                <% } %>


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
