<%@ page import="com.cropquiz.model.Player" %>

<%
    Player player = (Player) request.getAttribute("player");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Player</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            padding: 40px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 11px;
            background: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #216a94;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #555;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Edit Player</h1>

    <form action="players" method="post">

        <input
                type="hidden"
                name="action"
                value="update"
        >

        <input
                type="hidden"
                name="id"
                value="<%= player.getId() %>"
        >

        <label>Player Name</label>

        <input
                type="text"
                name="name"
                value="<%= player.getName() %>"
                required
        >

        <label>District</label>

        <input
                type="text"
                name="district"
                value="<%= player.getDistrict() %>"
                required
        >

        <label>Upazila</label>

        <input
                type="text"
                name="upazila"
                value="<%= player.getUpazila() %>"
                required
        >

        <button type="submit">
            Update Player
        </button>

    </form>

    <a class="back" href="players">
        ← Back to Player List
    </a>

</div>

</body>
</html>