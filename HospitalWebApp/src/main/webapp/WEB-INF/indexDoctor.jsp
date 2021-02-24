<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
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

    <link rel="stylesheet" href="css/index.css">

    <script>
        function active() {
            document.getElementById("doctor").disabled = false;
            var clinicId = document.getElementById("clinic").value;

        }

        function setIdForDelete(id) {
            var elem = document.getElementById("idForDelete")
            elem.value = id;
        }


    </script>

</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar" id="myNavbar">
        <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);"
           onclick="toggleFunction()" title="Toggle Navigation Menu">
            <i class="fa fa-bars"></i>
        </a>
        <a href="#home" class="w3-bar-item w3-button">HOME</a>
        <a href="#about" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> ABOUT</a>
        <a href="#appointment" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i> APPOINTMENT DATE</a>
        <a href="#contact" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i> CONTACT</a>
        <form action="workingHours" method="get">
            <input type="hidden" name="id" value="${user.id}">
            <button class="w3-bar-item w3-button w3-hide-small">
                <i class="fas fa-hospital-user"></i> Work Date
            </button>
        </form>

        <form action="logout">
            <button title="sign-out" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
                <i class="fas fa-sign-out-alt"></i>
            </button>
        </form>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
        <a href="#about" class="w3-bar-item w3-button" onclick="toggleFunction()">ABOUT</a>
        <a href="#appointment" class="w3-bar-item w3-button" onclick="toggleFunction()">APPOINTMENT DATE</a>
        <a href="#contact" class="w3-bar-item w3-button" onclick="toggleFunction()">CONTACT</a>
        <a href="#" class="w3-bar-item w3-button">SEARCH</a>
        <form action="workingHours" method="get">
            <input type="hidden" name="id" value="${user.id}">
            <button title="sign-out" class="w3-bar-item w3-button w3-hide-small">
                <i class="fas fa-hospital-user"></i> Work Date
            </button>
        </form>

        <form action="logout">
            <button title="sign-out" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
                <i class="fas fa-sign-out-alt"></i>
            </button>
        </form>
    </div>
</div>

<div class="w3-content w3-container w3-padding-64" id="home">
    <form>
        <div class="form-group row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Your Name</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext aboutbox" id="nm" value="${user.name}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Your Email</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext aboutbox" id="staticEmail" value="${user.username}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Your Id </label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext aboutbox" id="id" value="${user.id}">
            </div>
        </div>
    </form>

</div>
</div>

<!-- Container (About Section) -->
<div class="w3-content w3-container w3-padding-64" id="about">
    <h3 class="w3-center">ABOUT</h3>
    <p class="w3-center"><em>written about by default</em></p>
    <p>A hospital is a health care institution providing patient treatment with specialized medical and nursing staff
        and medical equipment.
        The best-known type of hospital is the general hospital, which typically has an emergency department to treat
        urgent health problems ranging from fire and accident victims to a sudden illness. A district hospital typically
        is the major health care facility in its region, with many beds for intensive care and additional beds for
        patients who need long-term care. Specialized hospitals include trauma centers, rehabilitation hospitals,
        children's hospitals, seniors' (geriatric) hospitals, and hospitals for dealing with specific medical needs such
        as psychiatric treatment (see psychiatric hospital) and certain disease categories. Specialized hospitals can
        help reduce health care costs compared to general hospitals.[2] Hospitals are classified as general, specialty,
        or government depending on the sources of income received.</p>
    <div class="w3-row">
        <div class="w3-col m6 w3-center w3-padding-large">
            <p><b><i class="fa fa-user w3-margin-right"></i>Hospital Name</b></p><br>
            <img src="static/css/hospital.jpg"
                 alt="Photo of doctors" width="300" height="200">
        </div>

        <!-- Hide this text on small devices -->
        <div class="w3-col m6 w3-hide-small w3-padding-large">
            <p>A teaching hospital combines assistance to people with teaching to medical students and nurses. A medical
                facility smaller than a hospital is generally called a clinic. Hospitals have a range of departments
                (e.g. surgery and urgent care) and specialist units such as cardiology. Some hospitals have outpatient
                departments and some have chronic treatment units. Common support units include a pharmacy, pathology,
                and radiology.</p>
        </div>
    </div>

    <div class="w3-row w3-center w3-dark-grey w3-padding-16">
        <div class="w3-quarter w3-section">
            <span class="w3-xlarge">85</span><br>
            Doctors
        </div>
        <div class="w3-quarter w3-section">
            <span class="w3-xlarge">18</span><br>
            Departments
        </div>
        <div class="w3-quarter w3-section">
            <span class="w3-xlarge">8</span><br>
            Research Labs
        </div>
        <div class="w3-quarter w3-section">
            <span class="w3-xlarge">150+</span><br>
            Awards
        </div>
    </div>

    <div class="w3-content w3-container w3-padding-64" id="appointment">
        <h3 class="w3-center">Add Appointment Date</h3>

        <div style="background-color: darkgray;">
            <div>
                <div class="form-group form-group col-md-6" style="margin-left: auto;margin-right: auto;">
                    <label for="example-date-input" class="col-2 col-form-label">add date</label>
                    <div class="col-10">
                        <form action="addAppointDate" method="post">
                            <input type="hidden" name="id" value="${user.id}">
                            <input type="hidden" name="action" value="add">
                            <input class="form-control" type="datetime-local" name="date" id="example-date-input"
                                   value=""
                                   min="2021-01-07T00:00" max="2025-06-14T00:00"
                            />
                            <button type="submit" class="btn btn-primary btn-block">Add</button>
                            <button type="reset" class="pull-left"
                                    style="border: firebrick;color: blue;">clear
                            </button>
                        </form>

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
                            <button title="delete" class="btn btn-danger" type="submit" value="Delete"
                                    data-toggle="modal" data-target="#exampleModal" onclick="setIdForDelete(${w.id})">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal for full size images on click-->
    <div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
        <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i
                class="fa fa-remove"></i></span>
        <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
            <img id="img01" class="w3-image">
            <p id="caption" class="w3-opacity w3-large"></p>
        </div>
    </div>

    <div class="bgimg-3 w3-display-container w3-opacity-min">
        <div class="w3-display-middle">
            <span class="w3-xxlarge w3-text-white w3-wide">CONTACT</span>
        </div>
    </div>

    <!-- Container (Contact Section) -->
    <div class="w3-content w3-container w3-padding-64" id="contact">
        <h3 class="w3-center">WHERE I WORK</h3>
        <p class="w3-center"><em>I'd love your feedback!</em></p>

        <div class="w3-row w3-padding-32 w3-section">
            <%--        <div class="w3-col m4 w3-container">--%>
            <%--            <img src="../resources/images.jpg" class="w3-image w3-round" style="width:100%">--%>
            <%--        </div>--%>
            <div class="w3-col m8 w3-panel">
                <div class="w3-large w3-margin-bottom">
                    <i class="fa fa-map-marker fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Chicago, US<br>
                    <i class="fa fa-phone fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Phone: +00
                    151515<br>
                    <i class="fa fa-envelope fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Email:
                    mail@mail.com<br>
                </div>
                <p>Swing by for a cup of <i class="fa fa-coffee"></i>, or leave me a note:</p>
                <form action="/action_page.php" target="_blank">
                    <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
                        <div class="w3-half">
                            <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
                        </div>
                        <div class="w3-half">
                            <input class="w3-input w3-border" type="text" placeholder="Email" required name="Email">
                        </div>
                    </div>
                    <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message">
                    <button class="w3-button w3-black w3-right w3-section" type="submit">
                        <i class="fa fa-paper-plane"></i> SEND MESSAGE
                    </button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
        <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
        <div class="w3-xlarge w3-section">
            <i class="fa fa-facebook-official w3-hover-opacity"></i>
            <i class="fa fa-instagram w3-hover-opacity"></i>
            <i class="fa fa-snapchat w3-hover-opacity"></i>
            <i class="fa fa-pinterest-p w3-hover-opacity"></i>
            <i class="fa fa-twitter w3-hover-opacity"></i>
            <i class="fa fa-linkedin w3-hover-opacity"></i>
        </div>
        <p>Developed by Mahammad Eminov</p>
    </footer>

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
                </div>s
                <div class="modal-footer">
                    <form action="deleteWorkHour" method="POST">
                        <input type="hidden" name="id" value="" id="idForDelete">
                        <input type="hidden" name="action" value="delete">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-danger" value="Delete"/>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <script src="js/index.js"></script>
</div>
</body>
</html>
