<%@ page import="java.util.List" %>
<%@ page import="com.cropquiz.model.Player" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CropGeoQuiz - Players</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 1000px;
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

        h2 {
            color: #34495e;
            margin-top: 30px;
        }

        form {
            display: grid;
            gap: 12px;
        }

        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            padding: 11px;
            background: #27ae60;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #219150;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background: #2c3e50;
            color: white;
        }

        .edit {
            color: #2980b9;
            text-decoration: none;
        }

        .delete {
            color: #e74c3c;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Crop & Geography Quiz</h1>

    <h2>Add Player</h2>

    <form action="players" method="post">

        <input
                type="text"
                name="name"
                placeholder="Player Name"
                required
        >

        <input
                type="text"
                name="district"
                placeholder="District"
                required
        >

        <input
                type="text"
                name="upazila"
                placeholder="Upazila"
                required
        >

        <button type="submit">
            Add Player
        </button>

    </form>


    <h2>Player List</h2>

    <table>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>District</th>
            <th>Upazila</th>
            <th>Score</th>
            <th>Actions</th>
        </tr>

        <%
            List<Player> players =
                    (List<Player>) request.getAttribute("players");

            if (players != null) {

                for (Player player : players) {
        %>

        <tr>

            <td>
                <%= player.getId() %>
            </td>

            <td>
                <%= player.getName() %>
            </td>

            <td>
                <%= player.getDistrict() %>
            </td>

            <td>
                <%= player.getUpazila() %>
            </td>

            <td>
                <%= player.getScore() %>
            </td>

            <td>

                <a class="edit"
                   href="players?action=edit&id=<%= player.getId() %>">
                    Edit
                </a>

                &nbsp; | &nbsp;

                <a class="delete"
                   href="players?action=delete&id=<%= player.getId() %>"
                   onclick="return confirm('Delete this player?');">
                    Delete
                </a>

            </td>

        </tr>

        <%
                }
            }
        %>

    </table>

</div>

</body>
</html>