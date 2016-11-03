<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

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
	
	</style>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

   
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
                                <li><a href="#profile-pills" data-toggle="tab" class="whitef"><strong>Profile</strong></a>
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
                                                  
                        					<div class="panel-body">
                           						<img src="dist/Images/pic1.jpg" class="img-circle" width="200" height="200" />
                                       </div>
                           		
                           			</div>
                 
                                    <div class="col-lg-8">                    
                      					<div class="panel panel-yellow">
                       						<div class="panel-heading">
                            					{{user name}}
                        					</div>
                        				<div class="panel-body">
                            					<p>{{user details}}</p>
                           						<br>
                           						 <br>
                           						 <br>
                           						 <br>
                           						 <br>
                           						 <br>
                        				</div>
                        				
                   				    </div>
                           
                                 </div>
                  
        						</div>
    
     
                              
                               
                                <div class="tab-pane fade whitef" id="messages-pills">
                                    <h4>Messages</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
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
