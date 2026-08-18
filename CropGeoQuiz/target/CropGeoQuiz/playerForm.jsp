<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crop Geo Quiz</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f6;
            padding: 40px;
        }

        .container {
            width: 450px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 6px;
            font-weight: bold;
            color: #34495e;
        }

        input {
            width: 100%;
            padding: 11px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #2980b9;
        }

        button {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #2980b9;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #216a94;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>🌾 Crop Geo Quiz</h1>

    <form action="players" method="post">

        <!-- Tell PlayerServlet to start the quiz -->
        <input type="hidden" name="action" value="startQuiz">

        <label for="name">Player Name</label>

        <input
                type="text"
                id="name"
                name="name"
                placeholder="Enter your name"
                required
        >

        <label for="district">District</label>

        <input
                type="text"
                id="district"
                name="district"
                placeholder="Example: Manikganj"
                required
        >

        <label for="upazila">Upazila</label>

        <input
                type="text"
                id="upazila"
                name="upazila"
                placeholder="Example: Harirampur"
                required
        >

        <button type="submit">
            Start Quiz
        </button>

    </form>

</div>

</body>
</html>