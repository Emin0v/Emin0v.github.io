function disWorkDate() {
    $("#appointdate").empty();
    $(document).ready(function () {
        $("#appointdate").append($('<option>', {value: 0, text: "Select Date"}));
    });
    document.getElementById("appointdate").disabled = true;
}

function fillInfo() {
    document.getElementById("clinicName").value = $("#clinic option:selected").text();
    document.getElementById("doctorName").value = $("#doctor option:selected").text();
    document.getElementById("workDate").value = $("#appointdate option:selected").text();

    document.getElementById("doctorId").value = document.getElementById("doctor").value;
    document.getElementById("date").value = document.getElementById("appointdate").value;
}

function activebtn() {
    var val1 = document.getElementById("clinic").value
    var val2 = document.getElementById("doctor").value
    var val3 = document.getElementById("appointdate").value

    if (val1 !== 0 && val2 !== 0 && val3 !== 0) {
        document.getElementById("submitbtn").disabled = false;
        document.getElementById("submitbtn").style.background = '#1977cc';
    }
    if (val3 == 0 || val2 == 0 || val1 == 0) {
        document.getElementById("submitbtn").disabled = true;
        document.getElementById("submitbtn").style.background = '#8a8a8a';
    }
}