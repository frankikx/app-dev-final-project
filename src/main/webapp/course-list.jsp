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
                                        <h5 class="m-b-10">COURSES</h5>
                                        <p class="m-b-0">Manage all courses here.</p>
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
                                                    <h5>Courses</h5>
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
                                                        <div class="p-15 p-b-0">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <!--<form class="form-material">
                                                                        <div class="form-group form-primary">
                                                                            <input type="text" name="footer-email" class="form-control" required="">
                                                                            <span class="form-bar"></span>
                                                                            <label class="float-label"><i class="fa fa-search m-r-10"></i>Search</label>
                                                                        </div>
                                                                    </form>-->
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <!--<button type="button" class="btn btn-mat waves-effect waves-light btn-success pull-left"><i class="ti-filter"></i> Filter</button>-->
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <a href="course-upsert.jsp" class="btn btn-mat waves-effect waves-light btn-primary pull-right"><i class="ti-plus"></i> Add Course</a>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>Course</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% while(resultSet.next()){ %>
                                                                <tr>
                                                                    <th scope="row"><%= resultSet.getString(1) %></th>
                                                                    <td><%= resultSet.getString(2) %></td>
                                                                    <td>
                                                                        <a href="course-view?courseId=<%= resultSet.getString(1) %>" class="btn btn-mat waves-effect waves-light btn-success "><i class="ti-search"></i> View</a>
                                                                    </td>
                                                                </tr>
                                                                <% } %>

                                                            </tbody>
                                                        </table>

                                                        <!--<nav aria-label="...">
                                                            <ul class="pagination">
                                                                <li class="page-item disabled">
                                                                    <span class="page-link">Previous</span>
                                                                </li>
                                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                                <li class="page-item active">
                                                                    <span class="page-link">
                                                                        2
                                                                        <span class="sr-only">(current)</span>
                                                                    </span>
                                                                </li>
                                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#">Next</a>
                                                                </li>
                                                            </ul>
                                                        </nav>-->
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
