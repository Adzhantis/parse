<?php
if(!preg_match('|<div id="menu-content">.*<div id="restaurant-reviews" class="tab-pane clearfix ">|isU', $inside_restaurant,$out))echo $restoran_name[$j].'20<hr> ';
if(!preg_match_all('|menu-headline">.*<div class="h2" id="|isU', $out[0], $categories))echo $restoran_name[$j].'22<hr> ';
if(!preg_match_all('|class="menu-headline">.*</div>|isU', $inside_restaurant, $category_name))echo $restoran_name[$j].'24<hr>';
$category_name = str_replace('class="menu-headline">','',$category_name[0]);
$category_name = str_replace('</div>','',$category_name);

// last category
$tempstring = $out[0];//last category
for($i=0;$i<count($categories[0]);$i++)
    $tempstring = preg_replace('|.*menu-headline|is','',$tempstring);
$categories[0][] = $tempstring;