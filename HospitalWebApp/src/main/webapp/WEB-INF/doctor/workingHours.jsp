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

        function setIdForUpdate(id, name) {
            var elem = document.getElementById("idForUpdate")
            elem.value = id;
        }

        function setNameAndDateForUpdate(name, date) {
            var elem = document.getElementById("patientName");
            var elem1 = document.getElementById("dateAndTime");
            elem.value = name;
            elem1.value = date;
        }

        function activeUpdateBtn(){
            document.getElementById("btnupdate").disabled=false;
        }

    </script>
</head>
<body style="margin: 20px">
<header>
    <form action="indexDoctor" method="get">
        <input type="hidden" name="id" value="${doctorId}">
        <button class="btn btn-info" type="submit"><i class="fas fa-arrow-left"></i> Back
        </button>
    </form>
</header>
<div>
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Doctor</th>
            <th>Patient</th>
            <th>Date</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${workHours}" var="w">
            <tr>
                <td>${w.id}
                </td>
                <td>${w.doctorId.name}
                </td>
                <td>${w.patientId.name}
                </td>
                <td>${w.appDate.replace("T"," // ")}
                </td>
                <td style="width: 5px">
                    <input type="hidden" name="id" value="${w.id}"/>
                    <input type="hidden" name="action" value="update"/>

                    <button class="btn btn-secondary" type="submit" value="Update"
                            data-toggle="modal" data-target="#exampleModal1"
                            onclick="setIdForUpdate(${w.id}) ; setNameAndDateForUpdate('${w.patientId.name}','${w.appDate}')">
                        <i class="fas fa-edit"></i>
                    </button>
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
                <form action="deleteAppointment" method="POST">
                    <input type="hidden" name="id" value="" id="idForDelete">
                    <input type="hidden" name="action" value="delete">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-danger" value="Delete"/>
                </form>

            </div>
        </div>
    </div>
</div>

<%--update--%>
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Update</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body ">
                <div>
                    <label for="patientName" class="form-label">Patient Name</label>
                    <input class="form-control" type="text" name="name" value="" id="patientName" oninput="activeUpdateBtn()">
                </div>
                <div>
                    <label for="dateAndTime" class="form-label">Date</label>
                    <input class="form-control" type="text" name="date" value="" id="dateAndTime" oninput="activeUpdateBtn()">
                </div>
            </div>
            <div class="modal-footer">
                <form action="" method="POST">
                    <input type="hidden" name="id" value="" id="idForUpdate">
                    <input type="hidden" name="action" value="update">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-danger" value="Update" id="btnupdate"  disabled/>
                </form>

            </div>
        </div>
    </div>
</div>
</body>
</html>
