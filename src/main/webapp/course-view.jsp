<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="WEB-INF/layout/head/headcontents.jsp" %>
    <%
    String onLoadSubject = (String)request.getAttribute("onLoadSubject");
    String onLoadContent = (String)request.getAttribute("onLoadContent");
    String onLoadShortDesc = (String)request.getAttribute("onLoadShortDesc");
    String courseId = request.getParameter("courseId");
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
                                        <h5 class="m-b-10"><%=onLoadSubject != null ? onLoadSubject : "" %></h5>
                                        <p class="m-b-0"><%=onLoadShortDesc != null ? onLoadShortDesc : "No short Description placed here" %></p>
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
                                            <!-- Typography card start -->
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Description</h5>
                                                </div>
                                                <div class="card-block typography">
                                                    <%=onLoadContent != null ? onLoadContent : "" %>
                                                    <br/><br/>
                                                    <%
                                                    if(userType != ""){
                                                    %>
                                                        <%
                                                        if(userType.equals("Student")){
                                                        %>
                                                    <button class="btn btn-mat waves-effect waves-light btn-success">Apply</button>
                                                        <%
                                                        }
                                                        %>
                                                        <%
                                                        if(userType.equals("Admin")){
                                                        %>
                                                    <a href="course-upsert?courseId=<%=courseId %>" class="btn btn-mat waves-effect waves-light btn-success">Edit</a>
                                                    <button type-"button" class="btn btn-mat waves-effect waves-light btn-danger" data-toggle="popover" data-html="true" data-placement="top" title="<b>Are you sure you want to remove this course?</b>" data-content="<center><a href='course-delete?courseId=<%=courseId %>' class='btn-danger btn btn-mat waves-effect waves-light'>Confirm</button></a>">Remove</button>


                                                        <%
                                                        }
                                                        %>


                                                    <%
                                                    }
                                                    %>


                                                </div>

                                            </div>
                                            <!-- Typography card end -->
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
<script>
    $(document).ready(function() {
        $('[data-toggle="popover"]').popover({
            html: true,
            content: function() {
                return $('#primary-popover-content').html();
            }
        });
    });

</script>

</body>

</html>
