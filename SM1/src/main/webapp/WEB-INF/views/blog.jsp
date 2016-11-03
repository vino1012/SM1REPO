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

<div ng-app="myApp" ng-controller="dataCtrl">


       <jsp:include page="fheader.jsp"></jsp:include>
                         
                 

        

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search" style="color:#5CB85C">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button" style="color:#5CB85C">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                          <li style="color:#5CB85C">
                            <a href="blogpost" style="color:#5CB85C">Post New <i class="fa fa-arrow-circle-right"></i></a>
                        </li>
                        <li style="color:#5CB85C">
                          <a href="#" style="color:#5CB85C"><i class="fa fa-dashboard fa-fw"></i>My Blog Posts</a>
                        </li>
                  		
                  		
                        <li style="color:#5CB85C" ng-repeat="ob in oblgs">
                            <a href="blogview?bid={{ob.blog_id}}" style="color:#5CB85C"><strong>{{ob.title}}</strong></a>
                        </li>
                        
              
                        <hr>
                        
                       
                            
                            <!-- /.nav-second-level -->
                       </ul>
                       </div>
                       </div>
                        
       
 <div id="wrapper">
        <div id="page-wrapper" >
          
    
            <div class="row">
               <div class="col-lg-12">
                  <a href="blog"><h1 class="page-header" style="color:#5CB85C" > <i class="fa fa-cloud fa-fw"></i>Blogger</h1></a>
                </div>
                </div>
                <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="color:#5CB85C">
                            <i class="fa fa-users fa-fw"></i> All Posts from all Users!
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" ng-controller="dataCtrl">
                            <div ng-show="!key" class="list-group" ng-repeat="blog in blgs|limitTo:10">
                                <a href="blogview?bid={{blog.blog_id}}" class="list-group-item" style="color:#5CB85C">
                                     {{blog.title}}
                                    <span class="pull-right text-muted small" style="color:#5CB85C"><em><i class="fa fa-clock-o fa-fw"> </i>{{blog.postedAt|myDate}} </em>
                                    </span>
                                       &nbsp<span class="pull-right text-muted small" style="color:#5CB85C"><em><i class="fa fa-user fa-fw"> </i>{{blog.postedBy}} &nbsp</em>
                                    </span>
                                </a>
                               
                            </div>
                              <div ng-show="key" class="list-group" ng-repeat="blog in blgs">
                                <a href="blogview?bid={{blog.blog_id}}" class="list-group-item" style="color:#5CB85C">
                                     {{blog.title}}
                                    <span class="pull-right text-muted small" style="color:#5CB85C"><em><i class="fa fa-clock-o fa-fw"> </i>{{blog.postedAt|myDate}} </em>
                                    </span>
                                       &nbsp<span class="pull-right text-muted small" style="color:#5CB85C"><em><i class="fa fa-user fa-fw"> </i>{{blog.postedBy}} &nbsp</em>
                                    </span>
                                </a>
                               
                            </div>
                            <!-- /.list-group -->
                            <a ng-show="!key" ng-click="key=true" href="" class="btn btn-default btn-block" style="color:#5CB85C"><strong>View All</strong></a>
                            <a ng-show="key" ng-click="key=false" href="" class="btn btn-default btn-block" style="color:#5CB85C"><strong>View Less</strong></a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    </div>
                    </div>
                    </div>
                    </div>
                    
</div>
                    
                    <jsp:include page="ffooter.jsp"></jsp:include>
                       <script>
var app=angular.module('myApp',[]);
app.controller('dataCtrl',function($scope)
		{
	
		$scope.blgs=${blogs};
		$scope.oblgs=${ownblogs}
		
		});
app.filter('myDate', function($filter) {    
    var angularDateFilter = $filter('date');
    return function(theDate) {
       return angularDateFilter(theDate, 'dd/MM/yyyy - hh:mm:ss a');
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
