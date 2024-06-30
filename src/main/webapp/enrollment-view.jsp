<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="WEB-INF/layout/head/headcontents.jsp" %>
    <%
    String onLoadSubject = (String)request.getAttribute("onLoadSubject");
    String onLoadContent = (String)request.getAttribute("onLoadContent");
    String onLoadShortDesc = (String)request.getAttribute("onLoadShortDesc");
    String onLoadLname = (String)request.getAttribute("onLoadLname");
    String onLoadFname = (String)request.getAttribute("onLoadFname");
    String onLoadMname = (String)request.getAttribute("onLoadMname");
    String onLoadCellNo = (String)request.getAttribute("onLoadCellNo");
    String onLoadhomeAddr = (String) request.getAttribute("onLoadhomeAddr");
    String onLoadEmail = (String) request.getAttribute("onLoadEmail");


    String enrollmentId = request.getParameter("enrollmentId");
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
                                        <h5 class="m-b-10">COURSE ENROLLMENT APPROVAL</h5>
                                        <p class="m-b-0">Review and process this application.</p>
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
                                        <div class="col-sm-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Student Information</h5>

                                                </div>
                                                <div class="card-block">
                                                    <form>
                                                        <div class="row">
                                                            <div class="form-group col-sm-4 form-default">
                                                                <input type="text" name="inputLname" class="form-control" required="" disabled value="<%=onLoadLname != null ? onLoadLname : "" %>">
                                                                <label class="float-label">Last Name</label>
                                                            </div>

                                                            <div class="form-group col-sm-4 form-default">
                                                                <input type="text" name="inputFname" class="form-control" required="" disabled value="<%=onLoadFname != null ? onLoadFname : "" %>">
                                                                <label class="float-label">First Name</label>
                                                            </div>

                                                            <div class="form-group col-sm-4 form-default">
                                                                <input type="text" name="inputMname" class="form-control" required="" disabled value="<%=onLoadMname != null ? onLoadMname : "" %>">
                                                                <label class="float-label">Middle Name</label>
                                                            </div>
                                                        </div>
                                                        <div class="row">

                                                            <div class="col-sm-4">
                                                                <input type="text" name="inputCellNo" class="form-control" required="" disabled value="<%=onLoadCellNo != null ? onLoadCellNo : "" %>">
                                                                <label class="float-label">Cellphone #</label>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <input type="text" name="inputEmail" class="form-control" required="" disabled value="<%=onLoadEmail != null ? onLoadEmail : "" %>">
                                                                <label class="float-label">Email#</label>
                                                            </div>

                                                        </div>
                                                        <div class="form-group row form-default">
                                                            <div class="col-sm-12">
                                                                <input type="text" name="inputHomeAddr" class="form-control" required="" disabled value="<%=onLoadhomeAddr != null ? onLoadhomeAddr : "" %>">
                                                                <label class="float-label">Home Address</label>
                                                            </div>

                                                        </div>

                                                    </form>
                                                    <br/><br/>
                                                    <button class="btn btn-mat waves-effect waves-light btn-primary" data-toggle="popover" data-html="true" data-placement="top" title="<b>Are you sure you want to approve this?</b>" data-content="<center><a href='enrollment-process?enrollmentId=<%=enrollmentId %>&statusId=2' class='btn-primary btn btn-mat waves-effect waves-light'>Confirm</button></a>">Approve</button>
                                                    <button class="btn btn-mat waves-effect waves-light btn-danger" data-toggle="popover" data-html="true" data-placement="top" title="<b>Are you sure you want to deny this?</b>" data-content="<center><a href='enrollment-process?enrollmentId=<%=enrollmentId %>&statusId=3' class='btn-danger btn btn-mat waves-effect waves-light'>Confirm</button></a>">Deny</button>
                                                    <button class="btn btn-mat waves-effect waves-light btn-success" data-toggle="popover" data-html="true" data-placement="top" title="<b>Are you sure you want to mark this as completed?</b>" data-content="<center><a href='enrollment-process?enrollmentId=<%=enrollmentId %>&statusId=5' class='btn-success btn btn-mat waves-effect waves-light'>Confirm</button></a>">Mark as Course Completed</button>
                                                    <br/>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <!-- Typography card start -->
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Applying For</h5>
                                                </div>
                                                <div class="card-block typography">
                                                    <h5><%=onLoadSubject != null ? onLoadSubject : "" %></h5>
                                                    <span><%=onLoadShortDesc != null ? onLoadShortDesc : "" %></span>
                                                    <br/><br/>

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
