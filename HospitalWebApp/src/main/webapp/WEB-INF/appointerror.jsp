<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
          integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
          crossorigin="anonymous"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <link href="css/myerror.css" rel="stylesheet">
</head>

<body>

<section>
    <div class="my row justify-content-center align-items-center">
        <div class="col-sm-6">
            <div class="test container m-3">


                <div class="mark text-center">
                    <i class="fas fa-times fa-9x "></i>
                    Xəta Baş verdi
                </div>

                <p>
                    Istediyiniz qeyde alınmadı.
                </p>

                <form action="index" method="get">
                    <div>
                        <button class="btn btn-outline-primary">Close</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

</section>
</body>

</html>
