<?php
	header('Access-Control-Allow-Origin: *');
	$cn = mysqli_connect("localhost","root","","asperopacificfoods");
	$rs = mysqli_query($cn,"select * from pedidos order by IdPedido desc limit 1");
	while($row=mysqli_fetch_assoc($rs)){
		$res[]=array_map("utf8_encode",$row);
	}
	echo json_encode($res);
	mysqli_close($cn);
?>