<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>International Cricket Co-Operation</title>
<style>
    header {
        background-color: blue;
        color: snow;
        margin: auto;
        font-family: sans-serif;
        height: 350px;
        width: 100%;
        text-align: center;
    }
    
    .logo {
        max-width: 200px;
        margin: auto;
        border-radius: 50%;
        display: block;
        border: 5px solid black;
    }
    
    .container {
        max-width: 800px;
        padding: 30px;
        background-color: black;
        color: white;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 1);
        border-radius: 10px;
    }
    
    .navbar {
        display: flex;
        justify-content: space-around;
        background-color: #570089;
        padding: 15px;
    }
    
    .navbar a {
        color: white;
        text-decoration: none;
    }
    
    .navbar a:hover {
        color: #000000;
    }
    
    .hero {
        height: 100vh;
        background: url("C:/Users/Aditya/Desktop/2nd SEM/FULL STACK DEVELOPMENT/7ec111864f7539dce5362ccf235b61a4.png") no-repeat center center;
        background-size: cover;
    }
    
    tr:hover {
        background-color: darkblue;
    }
    
    td {
        text-align: center;
    }
    
    footer {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: #570089;
        text-align: center;
        padding: 10px;
    }
</style>
</head>
<body bgcolor="skyblue">

<header>
    <img class="logo" src="C:\Users\Aditya\Desktop\LOGO.jpg" alt="ICC">
    <h1 style="font-size: 2.5em;">INTERNATIONAL CRICKET CO-OPERATION</h1>
    <p style="font-size: 1.8em;"><font color="white">SCORE UPDATES | UPCOMING TOURNAMENTS | PLAYERS RANKING</font></p>
</header>

<nav class="navbar">
    <a href="home.html">Home</a>
    <a href="artists.html">Artists</a>
    <a href="playlists.html">Playlists</a>
    <a href="virtual_concert.html">Virtual Concerts</a>
    <a href="#">About us</a>
</nav>

<div class="hero">
    <!-- The logo is set as the background image of this div -->
</div>
<center>

<div class="container">
    <table border="10" bgcolor="DeepSkyBlue">
        <tr>
            <th>POSITION</th>
            <th>PLAYER</th>
            <th>TEAM</th>
            <th>RATING</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Virat Kohli</td>
            <td>IND</td>
            <td>986</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Rassie van der Dussen</td>
            <td>SA</td>
            <td>844</td>
        </tr>


        <tr>
            <td>3</td>
            <td>Fakhar Zaman</td>
            <td>PAK</td>
            <td>755</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Imam-ul-haq</td>
            <td>PAK</td>
            <td>743</td>
        </tr>
        <tr>
            <td>5</td>
            <td>Shubham Gill</td>
            <td>IND</td>
            <td>738</td>
        </tr>
        <tr>
            <td>6</td>
            <td>Harry Hector</td>
            <td>IRE</td>
            <td>726</td>
        </tr>
        <tr>
            <td>7</td>
            <td>David Warner</td>
            <td>AUS</td>
            <td>726</td>
        </tr>
        <tr>
            <td>8</td>
            <td>Babar Azam</td>
            <td>PAK</td>
            <td>719</td>
        </tr>
        <tr>
            <td>9</td>
            <td>Quinton de Kock</td>
            <td>SA</td>
            <td>718</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Rohit Sharma</td>
            <td>IND</td>
            <td>707</td>
        </tr>
    </table>

</div>
<br><br><br><br>
<div class="container">
    <h2><b>Contact Us</b></h2>
<form>
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" >
    <br>
    
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" >
    <br>
    
    <label for="message">Message:</label>
    <textarea name="message" id="message"  rows="4" cols="50"></textarea>
    <br>
    
    <label>Checkbox:</label>
    <br>
    <input type="checkbox" name="checkbox1" id="checkbox1" value="option1"> Option 1
    <br>
    <input type="checkbox" name="checkbox2" id="checkbox2" value="option2"> Option 2
    <br>
    <input type="checkbox" name="checkbox3" id="checkbox3" value="option3"> Option 3
    <br>
    
    <label for="radio">Radio Button:</label>
    <input type="radio" name="radio" id="radio1" value="option1"> Option 1
    <input type="radio" name="radio" id="radio2" value="option2"> Option 2
    <br>
    
    <label for="dropdown">Dropdown:</label>
    <select name="dropdown" id="dropdown">
        <option value="option1">Option 1</option>
        <option value="option2">Option 2</option>
        <option value="option3">Option 3</option>
    </select>
    <br>
    
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" >
    <br>
    
    <label for="date">Date:</label>
    <input type="date" name="date" id="date" >
    <br>
    
    <input type="submit" value="Submit">
</form>

</div>
</center>
<footer>
    &copy; 2024 International Cricket Co-Operation. All rights reserved.
</footer>

</body>
</html>