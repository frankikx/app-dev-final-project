<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="WEB-INF/layout/head/headcontents.jsp" %>
    <%
    String subject = request.getParameter("inputCourseSubj");
    String content = request.getParameter("inputCourseContent");
    String onLoadSubject = (String)request.getAttribute("onLoadSubject");
    String onLoadContent = (String)request.getAttribute("onLoadContent");
    String onLoadShortDesc = (String)request.getAttribute("onLoadShortDesc");
    String courseId = request.getParameter("courseId");
    %>
    <style>
     .box
     {
      width:100%;
      max-width:600px;
      background-color:#f9f9f9;
      border:1px solid #ccc;
      border-radius:5px;
      padding:16px;
      margin:0 auto;
     }
     .ck-editor__editable[role="textbox"] {
                    /* editing area */
                    min-height: 300px;
                }
     .error
    {
      color:  red;
    }
    </style>
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
                                        <h5 class="m-b-10">SAVE COURSE</h5>
                                        <p class="m-b-0">Make changes to this course.</p>
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

                                    <!-- Typography card start -->
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Save this course</h5>
                                        </div>

                                        <div class="card-block typography">
                                            <form action="course-upsert" method="post">
                                                <div class="form-group form-default">
                                                    <input type="text" name="inputCourseSubj" class="form-control" required="" value="<%=onLoadSubject != null ? onLoadSubject : "" %>">
                                                    <label class="float-label">Subject</label>
                                                </div>
                                                <div class="form-group form-default">
                                                    <textarea class="form-control" id="inputCourseShortDesc" name="inputCourseShortDesc"><%=onLoadShortDesc != null ? onLoadShortDesc : "" %></textarea>
                                                    <label class="float-label">Description</label>
                                                </div>
                                                <div class="form-group form-default">
                                                    <textarea id="inputCourseContent" name="inputCourseContent"><%=onLoadContent != null ? onLoadContent : "" %></textarea>
                                                    <label class="float-label">Contents</label>
                                                </div>
                                                <br/><br/>

                                                <input type="hidden" name="inputHiddenId" class="form-control" required="" value="<%=courseId %>">
                                                <button type="submit" class="btn btn-mat waves-effect waves-light btn-success">Save</button>
                                            </form>
                                        </div>

                                    </div>
                                    <!-- Typography card end -->

                                </div>
                                <!-- Page-body end -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main-body end -->

            </div>
        </div>
    </div>
</div>

<%@include file="WEB-INF/layout/body/footer.jsp" %>

<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script>
    ClassicEditor
        .create( document.querySelector( '#inputCourseContent' ))
        .catch( error => {
            console.error( error );
        });
</script>
</body>

</html>
