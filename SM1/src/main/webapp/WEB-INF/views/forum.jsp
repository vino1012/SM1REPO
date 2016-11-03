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


    <div id="wrapper" ng-app="myApp" >

       <jsp:include page="fheader.jsp"></jsp:include>
                         
                       
                        <div class="row"  >
                <div class="col-lg-12">
                  <a href="forum"><h1 class="page-header"> <i class="fa fa-comments fa-fw"></i>Forum</h1></a>
                </div>
                <!-- /.col-lg-12 -->
                
            </div>
            <!-- /.panel-heading -->   
            <div class="panel-footer">
                            <div class="input-group"  ng-init="contains=''">
                                <input id="btn-input" type="text" class="form-control input-sm" placeholder="Search the forum before you post a new one..." ng-model="contains"/>
                                <span class="input-group-btn">
                          
                                    <a href="searchforum?contains={{contains}}"class="btn btn-warning btn-sm" id="btn-chat">
                                        Search
                                    </a>
                             
                                </span>
                            </div>
                        </div>
                        <!-- /.panel-footer -->
                        
                        <div class="panel-body" style="background-color:white"  ng-controller="dataCtrl">
                            <ul class="chat">
                                <li class="left clearfix" ng-repeat="question in ques">
                          		
                                    <span class="chat-img pull-left">
                                        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font"><a href="viewquestion?fid={{question.forum_id}}">{{question.subject}}</a></strong>
                                            <small class="pull-right text-muted">
                                                 <i class="fa fa-user fa-fw"> </i> {{question.postedBy}}
                                            </small>
                                            <small class="pull-right text-muted">
                                                 <i class="fa fa-clock-o fa-fw"> </i>{{question.postedat|myDate}}
                                            </small>
                                        </div>
                                        <p>
                                        {{question.description}}
                                        </p>
                                    </div>
                              
  
                          
                                </li>
                                
                            </ul>
                                 <div class="well well-sm" style="background-color:white">

                           
                                
                                <span class="input-group-btn">
                                    <a href="askquestion" class="btn btn-primary btn-block" id="btn-chat">
                                        <strong class="primary-font">If you don't find what you are looking for you can post a new Question. Click to post a new Question.</strong>
                                    </a>
                                </span>
                          
                        </div>
                        </div>
                    
                
                    </div>
                    
                    <hr/>
                    <!-- /.panel .chat-panel -->
                    
                    <jsp:include page="ffooter.jsp"></jsp:include>
                    
        
   <script>
var app=angular.module('myApp',[]);
app.controller('dataCtrl',function($scope)
		{
	
		$scope.ques=${questions};
		
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
