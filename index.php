<meta charset="UTF-8">
<?php
include('src/abeautifulsite/SimpleImage.php');
set_time_limit (10000);
$server ='127.0.0.1';
$username = 'root';
$password = '';
$db_name="restaurants_ua";
$tbl_name="restaurants_ua";

require_once('from_db.php'); //import from RESTAURANTS

for($j=0;$j<count($restoran_id);$j++){
   // echo $restoran_name[$j],$restoran_link[$j],$restoran_id[$j],$city_name[$j];
    $sql_file='sushipoint.sql';
// Create database
    //$rrr=$restoran_name[$j];
    $conn = new mysqli($server, $username, $password);
    $sql = "CREATE DATABASE `".$restoran_name[$j]."`";
    if ($conn->query($sql) === TRUE) {
        echo "Database created successfully";
    } else {
        echo "Error creating database: " . $connect->error;
    }
    $conn->close();

    include_once('dump.php');//create db and insert dump
        import_tables("$server","$username","$password","$restoran_name[$j]","$sql_file", false); //dont delete the exiting tables, just add those, which doesnt exist

        $mysqli = new mysqli($server, $username, $password, $restoran_name[$j]);
        if (mysqli_connect_errno())   {   echo "Failed to connect to MySQL: " . mysqli_connect_error();   }

            //ресторан розробка кожного
            $inside_restaurant = file_get_contents($restoran_link[$j]);
          require_once('getCategory.php');
          // PATH FOR IMG
          $path='img/'.$restoran_id[$j]; $img50=$path.'/50px'; $img100=$path.'/100px'; $img180=$path.'/180px'; $img320=$path.'/320px';$img500=$path.'/500px'; $img800=$path.'/800px';$img1200=$path.'/1200px';$img1800=$path.'/1800px';$original=$path.'/original';
          makeDir($path); makeDir($img50);  makeDir($img100);  makeDir($img180);  makeDir($img320); makeDir($img500); makeDir($img800);makeDir($img1200);makeDir($img1800);makeDir($original);
          // PATH FOR IMG

          for($z=0;$z<count($categories[0]);$z++)
        {

            if(preg_match_all('|<div class="col-xs-12 col-sm-4 col-md-6 col-lg-4">.*<span class="btn-plus  img"></span>.*</span>.*</div>.*</div>|isU',$categories[0][$z],$product))
            {
                require('insert_into_items1.php');
            }
            else
            {
                require('insert_into_items2.php');
            }
        }
    unset($title);
    unset($weight);
    unset($description);
    unset($price);
    $mysqli->close();
}



function clear($text)
{
    $in = array('|\(|','|\)|');
    $text = preg_replace($in,'',$text);
    return $text;
}
function makeDir($path)
{
    return is_dir($path) || mkdir($path);
}

