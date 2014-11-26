<?php
preg_match_all('|<div class="menu-product clearfix no-variation">.*<div class="price">.*</div>.*</div>|isU',$categories[0][$z],$product);

for($m=0;$m<count($product[0]);$m++)  {//every product

    preg_match('|<div class="product-title no-variation">.*</div>|isU',$product[0][$m],$title);
    $title = str_replace(array('<div class="product-title no-variation">','</div>'),'',$title[0]);
    $title = str_replace(array('"',"'"),'',$title);
    $title = strip_tags($title);
    $title = trim($title);

    if(preg_match('|\(.*\)|isU',$title,$weight)){$weight = clear($weight[0]);}
    else{$weight=null;}

    if($product[0][$m]==false)echo $name.'98';
    if(preg_match('|<div class="price">.*</div>|isU',$product[0][$m],$price)){
        $price = str_replace('<div class="price">','',$price[0]);
        $price = str_replace(array("'",'<div>'),'',$price);
        $price = strip_tags($price);
        $price = trim($price);
    }else{$price=null;}

    preg_match('|<div class="product-description no-variation">.*</div>|isU',$product[0][$m],$description);
    $description = str_replace(array('<div class="product-description no-variation">','</div>'),'',$description[0]);
    $description = str_replace('"','',$description);
    $description = trim($description);

    $newfile=$original.'/'.$z.'-'.$m.'.jpg';
    $category_id=$z+1;//id ot 1 do .->a ne ot 0
// photo peace
    if(!preg_match('|<img class="menu-img-product" alt=".*" src=".*">|isU',$product[0][$m],$logo))
    {
        preg_match('|<img class="menu-img-product lazy" alt=".*" src=".*" data-original="(.*)">|isU',
            $product[0][$m],$logo2);
        preg_match('|data-original=".*">|isU',$logo2[0],$lazy);
        $lazy[0] = str_replace('data-original="','',$lazy[0]);
        $lazy[0] = 'http:'.str_replace('">','',$lazy[0]);
        //$lazy[0] = str_replace(" ", "%20", $lazy[0]);
        if($lazy[0]!=='http:')
            if (!copy($lazy[0], $newfile))
                echo "не удалось скопировать $lazy[0]...\n";
        try {
            $img = new abeautifulsite\SimpleImage($newfile);
            $img->fit_to_width(50)->save($img50.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(100)->save($img100.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(180)->save($img180.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(320)->save($img320.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(500)->save($img500.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(800)->save($img800.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(1000)->save($img1200.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(1000)->save($img1800.'/'.$z.'-'.$m.'.jpg');
        } catch(Exception $e) {
            echo 'Error: ' . $e->getMessage();
        }

    }else{
        $logo[0] = "http:".preg_replace(array('|<img class="menu-img-product" alt=".*" src="|','|"|'),'',$logo[0]);
        $logo[0] = substr($logo[0], 0, strlen($logo[0])-1);
        if($logo[0]!=='http:')
            if (!copy($logo[0], $newfile))
                echo "не удалось скопировать $logo[0]...\n";
        try {
            $img = new abeautifulsite\SimpleImage($newfile);
            $img->fit_to_width(50)->save($img50.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(100)->save($img100.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(180)->save($img180.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(320)->save($img320.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(500)->save($img500.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(800)->save($img800.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(1000)->save($img1200.'/'.$z.'-'.$m.'.jpg');
            $img->fit_to_width(1000)->save($img1800.'/'.$z.'-'.$m.'.jpg');
        } catch(Exception $e) {
            echo 'Error: ' . $e->getMessage();
        }
    }
        // photo peace
     $items ="INSERT INTO `items` (`group_id`,`category_id`,`name`,`name_ru`,`image`) VALUES
            ('1','".$category_id."','".$title."','".$title."','".$newfile."')" ;
    $insertInCategory="INSERT INTO `categories` (`group_id`,`id_master`,`name`,`name_ru`,`image`) VALUES
            ('1','1','".$category_name[$z]."','".$category_name[$z]."','".$newfile."')" ;

    if($m===0){
       // if(!$mysqli->query($insertInCategory))echo "not inserted2 in category City".$city_name[$j]." ".$restoran_name[$j].'$insertInCategory<br>';
        $mysqli->query($insertInCategory);//echo "not inserted2 in category City".$city_name[$j]." ".$restoran_name[$j].'$insertInCategory<br>';
    }
    if(!$mysqli->query($items))
    {
        echo "not inserted2 $city_name[$j] ".$restoran_name[$j].'<br>';
    }
}