#!/usr/bin/php


<?php

$mdb = new MongoDB\Driver\Manager("mongodb://djzreik:2011maxima@ds133241.mlab.com:33241/wowhz");
	$command = new MongoDB\Driver\Command(['ping' => 1]);
	$mdb->executeCommand ('db', $command);
	$servers = $mdb->getServers();  
	$filter = array();
	$query = new MongoDB\Driver\Query($filter);
	$races = $mdb->executeQuery("wowhz.Race", $query);


$db = new mysqli('localhost', 'root', '2011maxima', 'WoW');

if ($db->connect_errno > 0)
{
   echo __FILE__.":".__LINE__.": failed to connect to db, re: $db->connect_error".PHP_EOL;
   exit(0);
}



$fp = fopen('php://stdin', 'r');
$last_line = false;
$message = '';

$option = '';


while($option !== "3\n") {
print "Welcome to the WoW Armory! Please type in your password to log in as Admin, otherwise hit enter to continue.\n";

echo "Enter Password: \r\n";

$passwd =trim(fgets(STDIN));

$hashing= hash('sha256', $passwd);

$insertString = "SELECT * FROM User WHERE password='$hashing';";

$results = $db->query($insertString);
$column = mysqli_fetch_array($results);

if ($column['password'] == $hashing){
	
print "Welcome to the Admin Menu! You must be here because the new tier is out! Select 1 to Add Armor to the Database or Select 2 to Remove Armor from the Database, 3 to exit:  \r\n";
	
$option = fgets($fp, 1024); // read the special file to get the user input from keyboard

	
	 switch ($option) {
		case "1\n":

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

		$addquery = "INSERT INTO Equipment(Name, EquipmentID, Type, PrimaryStat, Slot, ClassID, SpecID) VALUES ('$Name', '$EquipmentID', '$Type', '$PrimaryStat', '$Slot', '$ClassID', '$SpecID')";

		$sendadd = $db->query($addquery);
		
		break; 

		case "2\n":

		print "Enter equipment to delete: ";
		print "Enter Name: \r\n";
		$Name =trim(fgets(STDIN));
		print "Enter Equipment ID: \r\n";
		$EquipmentID =trim(fgets(STDIN));
		

		$delquery = "DELETE FROM Equipment WHERE Name = '$Name' AND EquipmentID = '$EquipmentID'";

		$senddel = $db->query($delquery);
		break;
		
}
	
}

print "To Begin: Please select by typing the Class you would like to outfit: Death Knight, Druid, Hunter, Mage, Monk, Paladin, Priest, Rogue, Shaman, Warlock, Warrior, or Demon Hunter. Also, Some available races are: ";

foreach ($races as $wow) {

		
		$race = $wow->race;
		echo $race." ";
	}

		echo "\r\n";
$class = fgets($fp, 1024); // stores the class user inputs

$class = trim($class); //removes /n

	
print "Now please select your Spec. If you would like us to recommend all the armor availble for all the Specs of the class chosen, please press enter!\n";

$spec = fgets($fp, 1024); // stores the spec user inputs

$spec = trim($spec); //removes /n


$specID = $db->query("SELECT specID FROM Specs WHERE Name = '$spec'");

$specresult = mysqli_fetch_array($specID);

$spec2 = $specresult['specID'];

$armor1 = $db->query("SELECT * FROM Equipment WHERE SpecID = '$spec2'");

print "Here is the buildout that we recommend for the chosen Class\Spec. This Equipment can be obtained from the Zone listed below. They are scattered among the many Bosses in this raid. To Obtain them, we recommend a 10-Man Raid Team for the Lower Powered gear, and a 25-Man Raid team for the Higher Powered Gear. (We HIGHLY recommend joining a guild!) : Slot=\r\n";

while ($row = mysqli_fetch_array($armor1)) {
	if ($row ['Slot'] == 'Head'){
	
	echo "Head: ".$row['Name']."\r\n";
	echo "Zone: ".$row['Zone']."\r\n";
}
	if ($row ['Slot'] == 'Chest'){
	
	echo "Chest: ".$row['Name']."\r\n";
	echo "Zone: ".$row['Zone']."\r\n";
}
	if ($row ['Slot'] == 'Legs'){
	
	echo "Legs: ".$row['Name']."\r\n";
	echo "Zone: ".$row['Zone']."\r\n";
}
	if ($row ['Slot'] == 'Shoulders'){
	
	echo "Shoulders: ".$row['Name']."\r\n";
	echo "Zone: ".$row['Zone']."\r\n";
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
	echo "Zone: ".$row['Zone']."\r\n";
}
	if ($row ['Slot'] == 'Chest'){
	
	echo "Chest: ".$row['Name']."\r\n";
	echo "Zone: ".$row['Zone']."\r\n";
}
	if ($row ['Slot'] == 'Legs'){
	
	echo "Legs: ".$row['Name']."\r\n";
	echo "Zone: ".$row['Zone']."\r\n";
}
	if ($row ['Slot'] == 'Shoulders'){
	
	echo "Shoulders: ".$row['Name']."\r\n";
	echo "Zone: ".$row['Zone']."\r\n";
	
}
}


	

}




$db->close();
print "\nThanks for using WoW Armory, run the app again to build another class! Now go get a life, Goodbye. :)";
break;

}





?>
