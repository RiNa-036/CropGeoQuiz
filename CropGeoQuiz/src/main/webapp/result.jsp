<%
    String name = (String) request.getAttribute("name");
    String district = (String) request.getAttribute("district");
    String upazila = (String) request.getAttribute("upazila");

    Integer score = (Integer) request.getAttribute("score");
    Integer totalQuestions =
            (Integer) request.getAttribute("totalQuestions");

    if (score == null) {
        score = 0;
    }

    if (totalQuestions == null) {
        totalQuestions = 0;
    }

    double percentage = 0;

    if (totalQuestions > 0) {
        percentage =
                ((double) score / totalQuestions) * 100;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Quiz Result</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f4f7f6;
            margin: 0;
            padding: 50px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
        }

        .trophy {
            font-size: 55px;
            margin: 15px;
        }

        .player {
            font-size: 20px;
            margin: 15px 0;
        }

        .location {
            color: #666;
            margin-bottom: 25px;
        }

        .score {
            font-size: 45px;
            font-weight: bold;
            color: #27ae60;
            margin: 20px 0;
        }

        .percentage {
            font-size: 22px;
            color: #2980b9;
            margin-bottom: 25px;
        }

        .message {
            font-size: 18px;
            margin: 20px 0;
        }

        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }

        .button:hover {
            background: #216a94;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="trophy">
        🏆
    </div>

    <h1>Quiz Completed!</h1>

    <div class="player">

        <strong>Player:</strong>
        <%= name %>

    </div>

    <div class="location">

        <strong>District:</strong>
        <%= district %>

        <br>

        <strong>Upazila:</strong>
        <%= upazila %>

    </div>

    <div class="score">

        <%= score %> / <%= totalQuestions %>

    </div>

    <div class="percentage">

        Score: <%= String.format("%.1f", percentage) %>%

    </div>

    <div class="message">

        <% if (percentage >= 80) { %>

            🎉 Excellent! Great job!

        <% } else if (percentage >= 50) { %>

            👍 Good job! Keep learning!

        <% } else { %>

            📚 Keep practicing and try again!

        <% } %>

    </div>

    <a
            href="playerForm.jsp"
            class="button"
    >
        Play Again
    </a>

</div>

</body>

</html>