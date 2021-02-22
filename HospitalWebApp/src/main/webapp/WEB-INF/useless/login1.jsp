<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <link rel="stylesheet" href="assets/assets.css/login.assets.css">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>Title</title>
    <style>
        .myw{
            width: 25%;
            border: 3px solid;
            padding-right: 20px;
            margin-left: auto;
            margin-right: 60px;
            margin-top: 90px;
            background-color: lightslategrey;
            padding-left: 20px;
            padding-top: 50px;
            padding-bottom: 60px;
        }

        body{
            background-image: url("https://www.aamc.org/sites/default/files/styles/scale_and_crop_1200_x_666/public/Public%20Opinion%20Research%201200x666.jpg?itok=Z9g0DOPe");
            /*height: 300%;*/
            padding-top: 100px;
            padding-left: 100px;
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>


<form action="login" method="POST" >
    <div class="myw" >
        <h2 class="text-center">Log in</h2>
        <div class="form-group">

            <input placeholder="Enter email" class="form-control" type="email" name="email"/>

        </div>
        <div class="form-group">
            <input placeholder="Enter password" class="form-control" type="password" name="password"/>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Sign in</button>
        </div>
    </div>
</form>

</body>
</html>
