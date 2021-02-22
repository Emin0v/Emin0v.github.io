<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5c2575856c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <script>
        function setIdForDelete(id) {
            var elem = document.getElementById("idForDelete")
            elem.value = id;
        }

        function clearDate() {
            var elem = document.getElementById("example-date-input");
            elem.value = null;
        }
    </script>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: lightsteelblue">
        <a class="navbar-brand" href="#">My Date</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <form action="workingHours" method="get">
<%--                    <a class="nav-link" href="workingHours" >Working hours</a>--%>
                        <input type="hidden" name="id" value="<%=request.getAttribute("doctorId")%>">
                        <button>Working Hours</button>
                    </form>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li  >
<%--                    <a class="nav-link" href="#">Logout</a>--%>
<%--                    <input type="submit" name="logout" value="Logout" style="margin-left:auto ">--%>
                </li>
            </ul>
            <input type="submit" name="logout" value="Logout" style="margin-left:auto; color: dodgerblue">
        </div>
    </nav>
</header>
<div style="background-color: darkgray;">
 <div>
    <div class="form-group form-group col-md-6" style="margin-left: auto;margin-right: auto;">
        <label for="example-date-input" class="col-2 col-form-label">add date</label>
        <div class="col-10">
            <form action="addDoctor" method="post">
                <input type="hidden" name="id" value="<%=request.getAttribute("doctorId")%>">
                <input type="hidden" name="action" value="add">
                <input class="form-control" type="datetime-local" name="date" id="example-date-input" value=""
                       min="2021-01-07T00:00" max="2025-06-14T00:00"
                />
                <button type="submit" class="btn btn-primary btn-block">Add</button>
            </form>
            <button type="submit" class="pull-left" onclick="clearDate()" style="border: firebrick;color: blue;">clear</button>
        </div>
    </div>
 </div>
</div>
<div>
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Date</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${myDate}" var="w">
            <tr>
                <td>${w.id}
                </td>
                <td>${w.workDate.replace('T',' ')}
                </td>
                <td style="width: 5px">
                    <input type="hidden" name="id" value="${w.id}"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button class="btn btn-danger" type="submit" value="Delete"
                            data-toggle="modal" data-target="#exampleModal" onclick="setIdForDelete(${w.id})">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </td>

            </tr>

        </c:forEach>
        </tbody>
    </table>

</div>
<%--delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure?
            </div>
            <div class="modal-footer">
                <form action="deleteDoctor" method="POST">
                    <input type="hidden" name="id" value="" id="idForDelete">
                    <input type="hidden" name="doctorId" value="<%=request.getAttribute("doctorId")%>" >
                    <input type="hidden" name="action" value="delete">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-danger" value="Delete"/>
                </form>

            </div>
        </div>
    </div>
</div>
<%--update--%>
<%--<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel1">Update</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                 <input type="text" name="">--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <form action="doctor" method="POST">--%>
<%--                    <input type="hidden" name="id" value="" id="idForUpdate">--%>
<%--                    <input type="hidden" name="action" value="update">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                    <input type="submit" class="btn btn-danger" value="Update"/>--%>
<%--                </form>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
</html>
