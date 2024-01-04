<?php
	header('Access-Control-Allow-Origin: *');
	$cn = mysqli_connect("localhost","root","","asperopacificfoods");
	$sql = "select * from productos order by NomProducto";
	$rs = mysqli_query($cn,$sql);
	while($row=mysqli_fetch_assoc($rs)){
		$res[]=array_map("utf8_encode",$row);
	}
	echo json_encode($res);
	mysqli_close($cn);
?>
