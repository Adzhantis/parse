<meta charset="UTF-8">
<style>
    body{background-image:url(1.jpg);}
    table{
        color :black;
    }
</style>
<?php
$connect= mysqli_connect($server, $username, $password,$db_name);
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$sql="SELECT `city` FROM restaurants_ua";
if ($result=mysqli_query($connect,$sql))
{
    // Return the number of rows in result set
    $rowcount=mysqli_num_rows($result);
    $temp[]=mysqli_fetch_all($result);

    for ($d=0;$d<$rowcount;$d++)
         $city_name[] = $temp[0][$d][0];

    $city_name[]= array_unique($city_name);
//    echo "<pre>";
//    echo "<hr>";
//    print_r($city_name[278]);
//    echo "</pre>";

}
if($_GET):
$queryk = "SELECT `restaurant` FROM restaurants_ua where city='".$_GET['city']."'";
$restoran_from=mysqli_query($connect,$queryk);
$restoran_from_city[]=mysqli_fetch_all($restoran_from);

    echo '<table border="">';
    echo '<form method="POST" action="index.php" >';
    echo "<tr><th>Ресторани</th></tr><tr><input value='зробити вибрані ресторани' type='submit'style=font-size:15;display:block;float:left;color:red;padding:25px;margin:25px;></tr>";
    foreach($restoran_from_city[0] as $res):
        $res=str_replace(' ','_',$res);
        echo "<tr><td><input type='checkbox' value=".$res[0]." name=".$res[0].">".$res[0]."</td></tr>";
    endforeach;
    echo '</form>';
    echo '</table>';
endif;
//print_r($restoran_from_city[0]);
echo '<table border="">';
echo '<form method="GET" action="index.php" >';
echo "<tr><th>City</th></tr><tr><input style=font-size:30;display:block;float:left;color:red;padding:50px;margin:50px; value='ресторан' type='submit'></tr>";

foreach($city_name[278] as $cit):

echo "<tr><td><input type='checkbox'value=".$cit." name='city'>".$cit."</td></tr>";
endforeach;
echo '</form>';
echo '</table>';

//print_r($_POST);
if($_POST){

foreach($_POST as $current_restourant){
    $current_restourant=str_replace('_',' ',$current_restourant);
//echo $current_restourant.'<hr>';
    $sq="SELECT * FROM restaurants_ua WHERE restaurant='".$current_restourant."'";
    $restoran_f=mysqli_query($connect,$sq);
    $tem[]=mysqli_fetch_row($restoran_f);
    $restoran_id[] = $tem[0][0];
    $city_name[] = $tem[0][1];
    $restoran_name[] = $tem[0][2];
    $restoran_link[] = $tem[0][5];
    unset($tem);
}print_r($restoran_link);
}
$connect->close();



//
//$sql="SELECT * FROM restaurants where restaurant='".$name_from_dimas."'";
//if ($result=mysqli_query($connect,$sql))
//{
//    // Return the number of rows in result set
//    $rowcount=mysqli_num_rows($result);
//    $temp[]=mysqli_fetch_row($result);
//
//    $restoran_id = $temp[0][0];
//    $city_name = $temp[0][1];
//    $restoran_name = $temp[0][2];
//    $restoran_link = $temp[0][5];
//    printf("Result set has %d rows.\n",$rowcount);
//    echo "<pre>";
//    echo "<hr>";
//    print_r($temp[0]);
//    echo "<hr>";
//    print_r($city_name);
//    echo "</pre>";
//}
//$connect->close();