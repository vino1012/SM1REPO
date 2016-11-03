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
                          <a href="blogview?bid={{ob.blog_id}}" style="color:#5CB85C">  <strong>{{ob.title}}</strong></a>
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
                    <div class="panel panel-green" >
                        <div class="panel-heading" style="color:white">
                             <strong>{{blg.title}}</strong><div ng-show="{{owner}}" class="pull-right text-muted small"><a href="editblog?bid={{blg.blog_id}}" class="btn btn-primary btn-xs">Edit</a></div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <div class="list-group">
                                <div class="list-group-item" style="color:#5CB85C">
                                     <strong>{{blg.blog_content}}</strong>
                                   
                                </div>
                               
                            </div>
                            <!-- /.list-group -->
                            <div class="list-group">
                                <div class="list-group-item" style="color:#5CB85C" ng-repeat="blgcomment in blgcomments">
                                     {{blgcomment.comment}}<br>by  {{blgcomment.commentedby}} at {{blgcomment.commentedAt|myDate}}
                                   
                                </div>
                               
                            </div>
                        </div>
                        <!-- /.panel-body -->
                        
                       <div class="panel-footer">
                       <span class="pull-left text-muted small" style="color:#5CB85C"><em><i class="fa fa-clock-o fa-fw"> </i>Modified:{{blg.lastModified|myDate}} </em></span>
                   <span class="pull-right text-muted small" style="color:#5CB85C"><em><i class="fa fa-clock-o fa-fw"> </i>{{blg.postedAt|myDate}} </em>
                                    </span>
                                       &nbsp<span class="pull-right text-muted small" style="color:#5CB85C"><em><i class="fa fa-user fa-fw"> </i>{{blg.postedBy}} &nbsp</em>
                                    </span>
                       </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-green">
                    	<div class="panel-heading" style="color:white">
                             <strong>Leave your comment here.</strong>
                        </div>
                        <div class="panel-body">
                          <div class="list-group">
                          <form:form action="postblogcomment" method="post" commandName="blogcomment">
                                <div class="list-group-item" style="color:#5CB85C">
                               <form:input path="comment" type="text" class="form-control"/>
                               </div>
                               <div class="list-group-item" style="color:#5CB85C">
                               <input type="submit" class="btn btn-success" value="Comment" />                              
                              
                                </div>
                             </form:form>  
                            </div>
                        </div>
                        <div class="panel-footer">
                        
                        
                        </div>
                    </div>
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
	
		$scope.blg=${blog};
		$scope.oblgs=${ownblogs};
		$scope.owner=${oflag};
		$scope.blgcomments=${blogComments}
		
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
