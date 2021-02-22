<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>

<%--<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<!------ Include the above in your HEAD tag ---------->

<%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/assets.css/bootstrap.min.assets.css" rel="stylesheet" id="bootstrap-assets.css">--%>
<%--<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>

<style>
    body {
        background-image: url("https://www.aamc.org/sites/default/files/styles/scale_and_crop_1200_x_666/public/Public%20Opinion%20Research%201200x666.jpg?itok=Z9g0DOPe");
        /*height: 300%;*/
        padding-top: 100px;
        padding-left: 100px;
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    mywrite {
        border: 3px solid;
        padding: 20px;
        background-color: lightslategrey;
        padding-top: 100px;
        padding-left: 100px;

    }

</style>

<div class="container">

    <div id="login-row" class="row justify-content-end align-items-end">

        <div id="login-column" class="col-md-50">

            <div class="mywrite"  >
                <p class="login-msg-above">
                <h2>Annotation Tool Login</h2></p>
                <br>
                <div class="shape1"></div>
                <div class="shape2"></div>
                <div class="shape3"></div>
                <div class="shape4"></div>
                <div class="shape5"></div>
                <div class="shape6"></div>
                <div class="shape7"></div>
                <div class="float">
                    <form class="form" action="" >
                        <div class="form-group">
                            <label for="username" class="text-white">Username:</label><br>
                            <input type="text" name="username" id="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-white">Password:</label><br>
                            <input type="text" name="password" id="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>
