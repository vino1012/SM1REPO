<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css" />
    <link href="dist/css/style.css" rel="stylesheet" type="text/css" />
  </head>
  <body ng-app="chatApp">
    <div ng-controller="ChatCtrl" class="container">
      <form ng-submit="addMessage()" name="messageForm">
        <input type="text" placeholder="Compose a new message..." ng-model="message" />
        <div class="in">
          <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">140</span>
          <button ng-disabled="message.length > max || message.length === 0">Send</button>
        </div>
      </form>
      <hr />
      <p ng-repeat="message in messages | orderBy:'time':true" class="message">
        <time>{{message.time | date:'HH:mm'}}</time>
        <span ng-class="{self: message.self}">{{message.message}}</span>
         <span ng-class="{self: username.self}">{{message.username}}</span>
      </p>
    </div>
    <script src="dist/lib/sockjs/sockjs.min.js" type="text/javascript"></script>
    <script src="dist/lib/stomp-websocket/lib/stomp.min.js" type="text/javascript"></script>
    <script src="dist/lib/angular/angular.min.js"></script>
    <script src="dist/lib/lodash/dist/lodash.min.js"></script>
    <script src="dist/js/app.js" type="text/javascript"></script>
    <script src="dist/js/controllers.js" type="text/javascript"></script>
    <script src="dist/js/services.js" type="text/javascript"></script>
  </body>
</html>