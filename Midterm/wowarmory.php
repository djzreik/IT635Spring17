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

$exit = 

while ($option != 3) {
print "Welcome to the WoW Armory! Please type in your password to log in as Admin, otherwise hit enter to continue.\n";


$pw = fgets($fp, 1024); // read the special file to get the user input from keyboard

if ($pw == "wowadmin"){
	
	print "Welcome to the Admin Menu! You must be here because the new tier is out! Select 1 to Add Armor to the Database or Select 2 to Remove Armor from the Database, 3 to exit:  \r\n";
	
$option = fgets($fp, 1024); // read the special file to get the user input from keyboard

	
	 switch ($option) {
		case '1':

		print "Enter equipment to add: ";
		print "Enter Name: \r\n";
		$Name =trim(fgets(STDIN));
		print "Enter Equipment ID: \r\n";
		$EquipmentID =trim(fgets(STDIN));
		print "Enter Type: \r\n";
		$Type =trim(fgets(STDIN));
		print "Enter PrimaryStat: \r\n";
		$PrimaryStat =trim(fgets(STDIN));
		print "Enter Slot: \r\n";
		$Slot =trim(fgets(STDIN));
		print "Enter Class ID: \r\n";
		$ClassID =trim(fgets(STDIN));
		print "Enter Spec ID: \r\n";
		$SpecID =trim(fgets(STDIN));

		$addquery = "INSERT INTO Equipment(Name, EquipmentID, Type, PrimaryStat, Slot, ClassID, SpecID) VALUES ('$Name', '$EquipmentID', '$Type', '$PrimaryStat', '$Slot', '$ClassID', '$SpecID'";

		$sendadd = $db->query($addquery);
		break;

		case '2':

		print "Enter equipment to Delete: ";
		print "Enter Name: \r\n";
		$Name =trim(fgets(STDIN));
		print "Enter Equipment ID: \r\n";
		$EquipmentID =trim(fgets(STDIN));

		$delquery = "INSERT INTO Equipment(Name, EquipmentID, Type, PrimaryStat, Slot, ClassID, SpecID) VALUES ('$Name', '$EquipmentID', '$Type', '$PrimaryStat', '$Slot', '$ClassID', '$SpecID'";

		$sendadd = $db->query($addquery);
		break;

		
}
	
}

}




print "To Begin: Please select by typing the Class you would like to outfit: Death Knight, Druid, Hunter, Mage, Monk, Paladin, Priest, Rogue, Shaman, Warlock, Warrior, or Demon Hunter.\n";

$class = fgets($fp, 1024); // stores the class user inputs

$class = trim($class); //removes /n

	
print "Now please select your Spec. If you would like us to recommend all the armor availble for all the Specs of the class chosen, please press enter!\n";

$spec = fgets($fp, 1024); // stores the spec user inputs

$spec = trim($spec); //removes /n


$specID = $db->query("SELECT specID FROM Specs WHERE Name = '$spec'");

$specresult = mysqli_fetch_array($specID);

$spec2 = $specresult['specID'];

$armor1 = $db->query("SELECT * FROM Equipment WHERE SpecID = '$spec2'");

print "Here is the buildout that we recommend for the chosen Class\Spec: Slot=\r\n";

while ($row = mysqli_fetch_array($armor1)) {
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






if ($spec == "") 
{
	$classID = $db->query("SELECT classID FROM Classes WHERE Name = '$class'");
	$result = mysqli_fetch_array($classID);
	
	
	$class2 = $result['classID'];
	
$armor2 = $db->query("SELECT * FROM Equipment WHERE ClassID = '$class2'");

print "Here is the buildout that we recommend for the chosen Class\Spec: Slot=\r\n";

while ($row = mysqli_fetch_array($armor2)) {
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