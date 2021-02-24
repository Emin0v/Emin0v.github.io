<%@ page import="com.company.controller.LoginController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
          integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
    <script src="js/appointment.js"></script>
    <link rel="stylesheet" href="css/appointment.css">

    <script>
        function setDoctor() {
            var val = document.getElementById("clinic").value;
            $("#doctor").empty();
            $(document).ready(function () {
                $("#doctor").append($('<option>', {value: 0, text: "Select Doctor"}));
            });
            <c:forEach var="wl" items="${workerList}">
            if (('${wl.clinicId.id}') === val) {
                $(document).ready(function () {
                    $("#doctor").append($('<option>', {value: '${wl.userId.id}', text: '${wl.userId.name}'}));
                });
            }
            </c:forEach>

            if (val != 0) {
                document.getElementById("doctor").disabled = false;
            } else {
                document.getElementById("doctor").disabled = true;
            }

        }

        function setDate() {
            var doctorId = document.getElementById("doctor").value;
            $("#appointdate").empty();
            $(document).ready(function () {
                $("#appointdate").append($('<option>', {value: 0, text: "Select Date"}));
            });
            <c:forEach var="wh" items="${workHours}">
            if (('${wh.doctorId.id}') === doctorId) {
                $(document).ready(function () {
                    $("#appointdate").append($('<option>', {value: '${wh.workDate}', text: '${wh.workDate}'}));
                });
            }
            </c:forEach>

            if (doctorId != 0) {
                document.getElementById("appointdate").disabled = false;
            } else {
                document.getElementById("appointdate").disabled = true;
            }
        }

    </script>
</head>
<body>

<form action="appointment" method="post">
    <div class="row">
        <div class="col-md-4 form-group mt-3">
            <select oninput="setDoctor()" onchange="disWorkDate() ; activebtn()" name="clinicId" id="clinic"
                    class="form-select">
                <option value="0">Clinic seçin</option>
                <c:forEach items="${clinics}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
            <div class="validate"></div>
        </div>
        <div class="col-md-4 form-group mt-3">
            <select oninput="setDate()" onchange="activebtn()" name="doctor" class="form-select" id="doctor" disabled>
                <option value="0">Doctor seçin</option>
            </select>
            <div class="validate"></div>
        </div>
        <div class="col-md-4 form-group mt-3">
            <select onchange="activebtn()" name="appointDate" id="appointdate" class="form-select" disabled>
                <option value="0">Vaxt seçin</option>

            </select>
            <div class="validate"></div>
        </div>

    </div>
</form>
<div class="form-group mt-3">
                        <textarea class="form-control" name="message" rows="5"
                                  placeholder="Message (Optional)"></textarea>
    <div class="validate"></div>
</div>

<div class="text-center">
    <button class="mybtn" type="submit" value="Confirm" id="submitbtn"
            data-toggle="modal" data-target="#confirmModal" onclick="fillInfo()" disabled>Randevu al
    </button>
</div>

<form action="index" method="get">
    <button class="btn btn-outline-warning" type="submit"><i class="fas fa-arrow-left"></i> Geri
    </button>
</form>

<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Randevu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <span class="warninfo">Zəhmət olmasa məlumatları yoxlayın. Səhv olduğu zaman <strong>Geri</strong> düyməsinə basaraq formu yenidən doldurun</span>
                <div>
                    <label for="clinicName" class="form-label" >Clinic</label>
                    <input class="form-control" type="text" name="clinic" value="" id="clinicName" readonly>
                </div>
                <br>
                <div>
                    <label for="doctorName" class="form-label"s>Doctor</label>
                    <input class="form-control" type="text" name="doctor" value="" id="doctorName" readonly>
                </div>
                <br>
                <div>
                    <label for="workDate" class="form-label">Vaxt</label>
                    <input class="form-control" type="text" name="workDate" value="" id="workDate" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <form action="appointment" method="POST">
                    <input type="hidden" name="patientId" value="${user.id}">
                    <input type="hidden" name="doctorId" value="" id="doctorId">
                    <input type="hidden" name="workDate" value="" id="date">

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Geri</button>
                    <input type="submit" class="btn btn-primary" name="confirm" value="Təsdiqlə"/>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
