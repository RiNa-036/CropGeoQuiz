<%@ page import="java.util.List" %>
<%@ page import="com.cropquiz.model.Question" %>

<%
    List<Question> questions =
            (List<Question>) request.getAttribute("questions");

    String district =
            (String) request.getAttribute("district");

    String upazila =
            (String) request.getAttribute("upazila");

    String name =
            request.getParameter("name");

    if (name == null) {
        name = "";
    }

    if (questions == null) {
        questions = new java.util.ArrayList<>();
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Crop Geo Quiz</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f4f7f6;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 850px;
            margin: auto;
        }

        .header {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .header h1 {
            margin-top: 0;
            color: #2c3e50;
        }

        .info {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .info-box {
            background: #ecf5ff;
            padding: 10px 15px;
            border-radius: 7px;
        }

        .question-card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .question-number {
            color: #2980b9;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .question {
            font-size: 18px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 18px;
        }

        .category {
            display: inline-block;
            background: #e8f8f5;
            color: #148f77;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 13px;
            margin-bottom: 15px;
        }

        .option {
            display: block;
            margin: 10px 0;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 7px;
            cursor: pointer;
        }

        .option:hover {
            background: #f4f9ff;
        }

        .option input {
            margin-right: 10px;
        }

        .submit-btn {
            width: 100%;
            padding: 14px;
            background: #27ae60;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 17px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #219150;
        }

        .no-question {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 12px;
            color: #c0392b;
        }

    </style>

</head>

<body>

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>🌾 Crop Geo Quiz</h1>

        <div class="info">

            <div class="info-box">
                <strong>Player:</strong>
                <%= name %>
            </div>

            <div class="info-box">
                <strong>District:</strong>
                <%= district %>
            </div>

            <div class="info-box">
                <strong>Upazila:</strong>
                <%= upazila %>
            </div>

        </div>

    </div>


    <% if (questions.isEmpty()) { %>

        <div class="no-question">

            <h2>No Questions Found</h2>

            <p>
                No quiz questions are available for
                <strong><%= upazila %></strong>,
                <strong><%= district %></strong>.
            </p>

        </div>

    <% } else { %>


        <!-- QUIZ FORM -->

        <form action="result" method="post">

            <!-- Player information -->

            <input
                    type="hidden"
                    name="name"
                    value="<%= name %>"
            >

            <input
                    type="hidden"
                    name="district"
                    value="<%= district %>"
            >

            <input
                    type="hidden"
                    name="upazila"
                    value="<%= upazila %>"
            >


            <!-- QUESTIONS -->

            <%
                int questionNumber = 1;

                for (Question q : questions) {
            %>

            <div class="question-card">

                <div class="question-number">

                    Question <%= questionNumber %>

                </div>


                <div class="category">

                    <%= q.getCategory() %>

                </div>


                <div class="question">

                    <%= q.getQuestion() %>

                </div>


                <!-- Option A -->

                <label class="option">

                    <input
                            type="radio"
                            name="answer_<%= q.getId() %>"
                            value="A"
                            required
                    >

                    A. <%= q.getOptionA() %>

                </label>


                <!-- Option B -->

                <label class="option">

                    <input
                            type="radio"
                            name="answer_<%= q.getId() %>"
                            value="B"
                    >

                    B. <%= q.getOptionB() %>

                </label>


                <!-- Option C -->

                <label class="option">

                    <input
                            type="radio"
                            name="answer_<%= q.getId() %>"
                            value="C"
                    >

                    C. <%= q.getOptionC() %>

                </label>


                <!-- Option D -->

                <label class="option">

                    <input
                            type="radio"
                            name="answer_<%= q.getId() %>"
                            value="D"
                    >

                    D. <%= q.getOptionD() %>

                </label>

            </div>

            <%
                    questionNumber++;
                }
            %>


            <!-- SUBMIT -->

            <button
                    type="submit"
                    class="submit-btn"
            >
                Submit Quiz
            </button>

        </form>

    <% } %>

</div>

</body>
</html>