<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hailstone</title>

    <!-- stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <!-- javascript, jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
</head>


<body>

<div class="container">
    <div class="col-md-8">
        <h2>Hailstone Sequence</h2>
        <p>About Hailstone numbers: <a href="https://www.math.hmc.edu/funfacts/ffiles/10008.5.shtml" target="_blank">https://www.math.hmc.edu/funfacts/ffiles/10008.5.shtml</a>
        </p>
        <p>Enter a natural number to find out</p>
        <ul>
            <li>Steps required to end sequence</li>
            <li>Second largest number of sequence</li>
        </ul>
        <form id="inputForm" class="form-inline" action="" method="">
            <div class="form-group">
                <label for="inputNumber"></label>
                <input type="number" name="number" value="11" class="form-control" id="inputNumber"
                       placeholder="enter natural number">
            </div>
            <input class="btn btn-default" type="submit" value="Let's Hailstone">
        </form>
    </div> <!-- end #inputForm -->

    <div id="resultHolder" class="col-md-4"></div>
</div> <!-- end .container -->

<script>
    $(document).ready(function () {
        $("#inputForm").submit(function (e) {
            e.preventDefault();

            $("#resultHolder").html(""); //clear result from previous submission
            var inputNumber = $("#inputNumber").val(); //user's input number


            if (inputNumber > 0) {
                var data = {"number": inputNumber}; //prepare data for ajax request

                /* ajax request */
                var step, number;
                $.ajax({
                    type: "GET",
                    url: "/result",
                    data: data,
                    dataType: "json"
                }).done(function (res) {
                    var htmlString = "<h2>Result</h2>";
                    htmlString += "<p>Steps to end sequence: " + res.step + "</p>";
                    htmlString += "<p>Second largest number: " + res.number + "</p>";
                    $("#resultHolder").append(htmlString);
                    $("#resultHolder").css("color", "#228b22");
                }).fail(function () {
                    var htmlString = "<h2>Error</h2>";
                    htmlString += "<p>Internal server error !!!</p>";
                    $("#resultHolder").append(htmlString);
                    $("#resultHolder").css("color", "#ff0000");
                }); //end ajax request

            } else {
                var htmlString = "<h2>Error</h2>";
                htmlString += "<p>Negative input number !!!</p>";
                $("#resultHolder").append(htmlString);
                $("#resultHolder").css("color", "#ff0000");
            }
        });
    });
</script>

</body>

</html>
