<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>

    <script src="js/register.js"></script>
    <link rel="stylesheet" href="css/register.css">

</head>
<body>
<div class="container">
    <f:form action="register" method="post" class="form-horizontal" role="form" modelAttribute="register">
        <h2>MediLab Qeydiyyat</h2>
        <div class="form-group">
            <label for="firstName" class="col-sm-3 control-label">Ad</label>
            <div class="col-sm-9">
                <f:input path="firstName" id="firstName" placeholder="First Name" class="form-control" autofocus=""/>
                <f:errors path="firstName" cssClass="error"/>
            </div>
        </div>
        <div class="form-group">
            <label for="lastName" class="col-sm-3 control-label">Soyad</label>
            <div class="col-sm-9">
                <f:input path="lastName" id="lastName" placeholder="Last Name" class="form-control" autofocus=""/>
                <f:errors path="lastName" cssClass="error"/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-3 control-label">Email* </label>
            <div class="col-sm-9">
                <f:input path="username" type="email" id="email" placeholder="Email" class="form-control" name="email"/>
                <f:errors path="username" cssClass="error"/>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">Password*</label>
            <div class="col-sm-9">
                <f:input path="password" type="password" id="password" placeholder="Password" class="form-control"/>
                <f:errors path="password" cssClass="error"/>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-4 control-label">Confirm Password*</label>
            <div class="col-sm-9">
                <f:input path="confirmPassword" type="password" id="password" placeholder="Password"
                         class="form-control"/>
                <f:errors path="confirmPassword" cssClass="error"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3">
                <span style="color: red"><%=request.getAttribute("message")==null?"":request.getAttribute("message")%></span>
            </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Təsdiq</button>
        <p class="pull-left" style="font-size: 20px;"><a href="login"><small>Geri</small></a></p>
    </f:form> <!-- /form -->
</div> <!-- ./container -->
</body>
</html>
