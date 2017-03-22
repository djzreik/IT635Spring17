#!/usr/bin/php


<?php

$db = new mysqli('localhost', 'root', '2011maxima', 'WoW');

if ($db->connect_errno > 0)
{
   echo __FILE__.":".__LINE__.": failed to connect to db, re: $db->connect_error".PHP_EOL;
   exit(0);
}



$fp = fopen('php://stdin', 'r');
$last_line = false;
$message = '';


print "Welcome to the WoW Armory! Please type in your password to log in as Admin, otherwise hit enter to continue.\n";

$next_line = fgets($fp, 1024); // read the special file to get the user input from keyboard

print "To Begin: Please select by typing the Class you would like to outfit: Death Knight, Druid, Hunter, Mage, Monk, Paladin, Priest, Rogue, Shaman, Warlock, Warrior, or Demon Hunter.\n";

$class = fgets($fp, 1024); // stores the class user inputs

$class = trim($class); //removes /n

	
print "Now please select your Spec. If you would like us to recommend all the armor availble for all the Specs of the class chosen, please press enter!\n";

$spec = fgets($fp, 1024); // stores the spec user inputs

$spec = trim($spec); //removes /n

if ($spec == "") 
{
	$classID = $db->query("SELECT classID FROM Classes WHERE Name = '$class'");
	$result = mysqli_fetch_array($classID);
	
	
	$class2 = $result['classID'];
	
$armor = $db->query("SELECT * FROM Equipment WHERE ClassID = '$class2'");

print "Here is the buildout that we recommend for the chosen Class\Spec: Slot=\r\n";

while ($row = mysqli_fetch_array($armor)) {
	if ($row ['Slot'] == 'Head'){
	
	echo "Head: ".$row['Name']."\r\n";
	
}
	if ($row ['Slot'] == 'Chest'){
	
	echo "Chest: ".$row['Name']."\r\n";
	
}
	if ($row ['Slot'] == 'Legs'){
	
	echo "Legs: ".$row['Name']."\r\n";
	
}
	if ($row ['Slot'] == 'Shoulders'){
	
	echo "Shoulders: ".$row['Name']."\r\n";
	
}
}


	

}




$db->close();
print "\nThanks for using WoW Armory, run the app again to build another class! Now go get a life, Goodbye. :)";


?>
