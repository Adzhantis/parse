<?php


function import_tables($server,$user,$password,$name,$sql_file,  $clear_or_not=false )
{
    if (!file_exists($sql_file)) {die('Input the SQL filename correctly! <button onclick="window.history.back();">Click Back</button>');}

    // Connect to MySQL server
    //$link = mysqli_connect($host,$user,$pass,$name);
    //mysqli_select_db($link,$mysqli);
    $mysqli = new mysqli($server, $user, $password, $name);
    // Check connection
    if (mysqli_connect_errno())   {   echo "Failed to connect to MySQL: " . mysqli_connect_error();   }

    if($clear_or_not)
    {
        $zzzzzz = $mysqli->query('SET foreign_key_checks = 0');
        if ($result = $mysqli->query("SHOW TABLES"))
        {
            while($row = $result->fetch_array(MYSQLI_NUM))
            {
                $mysqli->query('DROP TABLE IF EXISTS '.$row[0]);
            }
        }
        $zzzzzz = $mysqli->query('SET foreign_key_checks = 1');
    }

    $mysqli->query("SET NAMES 'utf8'");
    // Temporary variable, used to store current query
    $templine = '';
    // Read in entire file
    $lines = file($sql_file);
    // Loop through each line
    foreach ($lines as $line)
    {
        // Skip it if it's a comment
        if (substr($line, 0, 2) == '--' || $line == '')
            continue;
        // Add this line to the current segment
        $templine .= $line;
        // If it has a semicolon at the end, it's the end of the query
        if (substr(trim($line), -1, 1) == ';')
        {
            // Perform the query
            $mysqli->query($templine);// or print('Error performing query \'<strong>' . $templine . '\': ' . $mysqli->error . '<br /><br />');
            // Reset temp variable to empty
            $templine = '';
        }
    }
    $insertInCity="INSERT INTO `cities` (`city_id`,`country_id`,`important`,`region_id`,`title_ru`) VALUES
            (null,'1','1','1','volgograd')";
    if(!$mysqli->query($insertInCity))echo "<hr>$city_name[$j] is not inserted<br><hr />";
    echo 'Tables imported successfully. <button onclick="window.history.back();">Go Back</button>';
    $mysqli->close();
}
