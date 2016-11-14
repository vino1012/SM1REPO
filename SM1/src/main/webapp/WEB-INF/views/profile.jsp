<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <title>Social Media</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<style>
	.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
    color:white;
    background-color:#F0AD4E;
    }
.whitef{color:#F0AD4E}
		.nav>li>a.active,
.nav>li>a:hover,
.nav>li>a:focus {
   background-color: #F0AD4E;
   color:white
}
tr.spaceUnder > td
{
  padding-bottom: 1em;
}
	
	</style>
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body ng-app="myApp" ng-controller="dataCtrl" >

   
       <jsp:include page="fheader.jsp"></jsp:include>
       
              <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search" style="color:#5CB85C">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button" style="color:#F0AD4E">
                                    <i class="fa fa-search"></i>
                                </button>
                                
                            </span>
                          
                            </div>
                            <!-- /input-group -->
                        </li>
                        <hr>

                       
                            
                            <!-- /.nav-second-level -->
                       </ul>
                       </div>
                       </div>
       
       
<div id="wrapper">
<div id="page-wrapper">

                   
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-pills" >
                                <li class="active"><a href="#home-pills" data-toggle="tab" class="whitef"><strong>Home</strong></strong></a>
                                </li>
                                <li><a href="#profile-pills" data-toggle="tab" class="whitef" ><strong>Profile</strong></a>
                                </li>
                                <li><a href="#messages-pills" data-toggle="tab" class="whitef"><strong>Messages</strong></a>
                                </li>
                                <li><a href="#settings-pills" data-toggle="tab" class="whitef"><strong>Settings</strong></a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <hr>
                            <div class="tab-content">
                            
                                <div class="tab-pane fade in active whitef" id="home-pills">
                                    <h4><strong>Welcome</strong></h4>
                                    <hr>
                                    <p>Welcome to your own profile page. Share, chat Enjoy!!</p>
                                </div>
                                
                                <div class="tab-pane fade whitef" id="profile-pills">
                                    <h4><strong>Profile</strong></h4>
                                    <hr>
                                    <div class="col-lg-4">
                                                <br>
                                                <br>  
                        					<div class="panel-body">
                           						<img ng-src="dist/Images/{{imagedata}}" class="img-circle" width="200" height="200" />
                           						<br><div><a href="#uploadModal" data-toggle="modal" style="color:#F0AD4E"><strong>&nbsp Change your Profile Picture</strong></a></div>
                                       		</div>
                                       		<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Select your file here!</h4>
                                        </div>
                                        <div class="modal-body">
                                        <form:form method="POST" modelAttribute="FileObj" enctype="multipart/form-data" class="form-horizontal">
         
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="file">Upload a file</label>
                    <div class="col-md-7">
                        <form:input type="file" path="file" id="file" />
                        
                    </div>
                </div>
            </div>
     
         
                <div class="form-actions floatRight">
                    <input type="submit" value="Upload" class="btn btn-warning btn-sm" >
                </div>
       
        </form:form>
              
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                          
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                           		
                           			</div>
      
                                    <div class="col-lg-8">                    
                      					<div class="panel panel-yellow">
                       						<div class="panel-heading" >
                            				<strong>{{userdata.firstName+' '+userdata.lastName}}</strong>
                        					</div>
                        				<div class="panel-body">
                            					<table padding="10" style="font-weight:bold" >
                            					<tr class="spaceUnder">
                            					<td>First Name</td><td>&nbsp:&nbsp</td><td>{{userdata.firstName}}</td>
                            					</tr>
                            					<tr class="spaceUnder">
                            					<td>Last Name</td><td>&nbsp:&nbsp</td><td>{{userdata.lastName}}</td>
                            					</tr>
                            					<tr class="spaceUnder">
                            					<td>Email</td><td>&nbsp:&nbsp</td><td>{{userdata.email}}</td>
                            					</tr>
                            					<tr class="spaceUnder">
                            					<td>Sex</td><td>&nbsp:&nbsp</td><td>{{userdata.gender}}</td>
                            					</tr >
                            					<tr class="spaceUnder">
                            					<td>Date of Birth</td><td>&nbsp:&nbsp</td><td>{{userdata.dob|dateOnly}}</td>
                            					</tr>
                            					<tr class="spaceUnder">
                            					<td colspan="3"><a href="" style="color:#F0AD4E">Click here</a> to add Academic details</td>
                            					</tr>
                            					<tr class="spaceUnder">
                            					<td colspan="3"><a href="" style="color:#F0AD4E">Click here</a> to add Work details</td>
                            					</tr>
                            					<tr>
                            					<td colspan="3"><a href="" style="color:#F0AD4E">Click here</a> to add Other Personal details</td>
                            					</tr>
                            				
                            					</table>
                        				</div>
                        				
                   				    </div>
                           
                                 </div>
                  
        						</div>
    
     
                              
                               
                                <div class="tab-pane fade whitef" id="messages-pills">
                                    <h4>Messages</h4>
                                    <a href="chats">Click here to launch a private chat window.</a>
                                </div>
                                <div class="tab-pane fade whitef" id="settings-pills">
                                    <h4>Settings</h4>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                 
                    <!-- /.panel -->
                
                </div><!--  Page wrapper -->
                </div><!-- wrapper -->
           
 <jsp:include page="ffooter.jsp" />
 <script>
 var app=angular.module('myApp',[]);
 app.controller('dataCtrl',function($scope, $interval)
		 {
 	
	 $scope.userdata = ${userString};
	 $scope.imagedata=${imageString};
    
 	
 		
 		
 
 	
 		});
app.filter('myDate', function($filter) {    
    var angularDateFilter = $filter('date');
    return function(theDate) {
       return angularDateFilter(theDate, 'dd/MM/yyyy - hh:mm:ss a');
    }
});
app.filter('dateOnly', function($filter) {    
    var angularDateFilter = $filter('date');
    return function(theDate) {
       return angularDateFilter(theDate, 'dd/MM/yyyy');
    }
});
</script>
 
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <script src="vendor/morrisjs/morris.min.js"></script>
    <script src="data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    

</body>

</html>
