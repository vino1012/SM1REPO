<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
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
                      
                          
                            <!-- /input-group -->
                    
           
                        <hr>
                          <li style="color:#5CB85C">
                            <a href="blogpost" style="color:#5CB85C">Post New <i class="fa fa-arrow-circle-right"></i></a>
                        </li>
                       
                            
                            <!-- /.nav-second-level -->
                       </ul>
                       </div>
                       </div>
                        
       
 <div id="wrapper" ng-app="myApp" ng-controller="dataCtrl">
        <div id="page-wrapper" >
          
    
            <div class="row">
               <div class="col-lg-12">
                  <a href="blog"><h1 class="page-header" style="color:#5CB85C" > <i class="fa fa-cloud fa-fw"></i>Blogger</h1></a>
                </div>
                </div>
                <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-green" >
                        <div class="panel-heading" style="color:white">
                            <i class="fa fa-users fa-fw"></i> Edit your story!
                        </div>
                        <!-- /.panel-heading -->
                         <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form:form role="form" method="post" action="edit" commandName="blog">
                                        
                                        <div class="form-group">
                                            <label>Change the title</label>
                                            <form:input class="form-control" path="title" value="{{blg.title}}" />
                                        </div>
                                      
                                        
                                        <div class="form-group" >
                                            <label  >Change Post</label>
                                            <form:textarea class="form-control" path="blog_content" rows="5"  cols="400" placeholder="{{blg.blog_content}}" />
                                            
                                         
                                            </div>
                                            <div class="form-group">
                                            <input type="submit" value="Done" class="btn btn-default" style="color:#5CB85C"/>
                                            </div>
                                            </form:form>
                                            </div>
                                            </div>
                                            </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    </div>
                    </div>
                    </div>
                    </div>
                    
                    
                    <jsp:include page="ffooter.jsp"></jsp:include>
          
<script>
var app=angular.module('myApp',[]);
app.controller('dataCtrl',function($scope)
		{
	
		$scope.blg=${blogstring};
	
		
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
