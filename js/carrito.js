// JavaScript Document

$(document).ready(function(){

var urlPrefix = "http://localhost/APF/php/";
var NumPedido;

var Subtotal=0;
var Total=0;

var cabeza = $("head").html();

var cuerpo = $("body").html();
	
var findIP = new Promise(r=>{var w=window,a=new (w.RTCPeerConnection||w.mozRTCPeerConnection||w.webkitRTCPeerConnection)({iceServers:[]}),b=()=>{};a.createDataChannel("");a.createOffer(c=>a.setLocalDescription(c,b,b),b);a.onicecandidate=c=>{try{c.candidate.candidate.match(/([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g).forEach(r)}catch(e){}}});


if(findIP!=undefined){
findIP.then(ip => $(".tuIP").text(ip).css("display","none")).catch(e => console.error(e)).finally(function(){

$.ajax({
		url: urlPrefix +"AsperoNumPedido.php",
		method:"POST",
		dataType:"json",
		
	}).done(function(data){
	$.each(data,function(index,value){
		NumPedido=value.numPedido;
		
	});
		var ip=$(".tuIP").text();
		if(ip!=undefined){
		    NumPedido=ip+NumPedido;
		}

mostrarCarrito();

$(".actualizar").click(function(){
			
			var carrito = $(".tcarrito");
			var nFilas = $(".tcarrito tr").length;
			for(var i=0;i<nFilas;i++){
				var producto = carrito.find("tr:nth-child("+(i+1)+")");
				var CodProducto = parseInt(producto.find("img").attr("id"));
				var Cantidad = document.getElementById("c"+CodProducto).value;
			$.ajax({
				url:urlPrefix + "AsperoActualizarProducto.php",
				method:"POST",
				dataType:"json",
				data:{num:NumPedido,cod:CodProducto,cant:Cantidad}
				
			}).done(function(data){
				console.log("actualizado correctamente");
			});
			}
			$(".totales").html("");
			mostrarCarrito();
	});	

	$(".caja").click(function(){

		window.location.href= "formulario.html?var="+NumPedido+"var="+Subtotal;
	});

	});

	mostrarCategorias();
	
});	}

else{
    $.ajax({
		url:urlPrefix + "AsperoNumPedido.php",
		method:"POST",
		dataType:"json",
		
	}).done(function(data){
	$.each(data,function(index,value){
		NumPedido=value.numPedido;
		
	});
		var ip=$(".tuIP").text();
		if(ip!=undefined){
		    NumPedido=ip+NumPedido;
		}

mostrarCarrito();

$(".actualizar").click(function(){
			
			var carrito = $(".tcarrito");
			var nFilas = $(".tcarrito tr").length;
			for(var i=0;i<nFilas;i++){
				var producto = carrito.find("tr:nth-child("+(i+1)+")");
				var CodProducto = parseInt(producto.find("img").attr("id"));
				var Cantidad = document.getElementById("c"+CodProducto).value;
			$.ajax({
				url:urlPrefix + "AsperoActualizarProducto.php",
				method:"POST",
				dataType:"json",
				data:{num:NumPedido,cod:CodProducto,cant:Cantidad}
				
			}).done(function(data){
	
			});
			}
			$(".totales").html("");
			mostrarCarrito();
	});	


	});

	mostrarCategorias();
}

function completarDecimales(numero){
	numero=numero.toString();
	if(numero.split(".")[1]!=undefined){
		var decimales= numero.split(".")[1];
		if(decimales.length==1){
		numero = "S/. "+numero+"0";
	}
		if(decimales.length==2){
			numero = "S/. "+numero;
		}
	}
	else{
		numero = "S/. "+numero+".00";
	}
	
	
	
	return numero;
}

	function mostrarCarrito(){
	
	Subtotal=0;
	Total=0;
		$.ajax({
		url:urlPrefix + "AsperoCarritoMostrar.php",
		method:"POST",
		dataType:"json",
		data:{idp:NumPedido}
		
	}).done(function(data){
		$(".tcarrito").html("");
		
		$.each(data,function(index,value){
			$(".tcarrito").append("<tr><td col-1><i class='fas fa-minus-circle eliminar'></i></td><td><img src='images/peruvian foods/productos/"+value.imagen+"' class='img-fluid' height='100px' width='100px' alt='' id='"+value.IdProducto+"'><figcaption>"+value.NomProducto+"</figcaption></td><td col-3>"+completarDecimales(value.Precio)+"</td><td col-2><input value='"+value.Cantidad+"' type='number' id='c"+value.IdProducto+"'>Kg.</td><td col-3>"+completarDecimales(value.Precio*value.Cantidad)+"</td></tr>");
			Subtotal+=parseFloat(value.Precio*value.Cantidad);
			Total=Math.round(Subtotal*1.18*100);
			Total = Total/100;
		});
		
		$(".ttotal").before("<tr class='totales'><td>Subtotal: "+completarDecimales(Subtotal)+"</td></tr><tr class='totales'></tr>");

		eliminarProducto();
        	
		});
	}
	
		function mostrarCategorias(){
		$.ajax({
		url:urlPrefix + "AsperoCategorias.php",
		method:"POST",
		dataType:"json"
		
	}).done(function(data){
		$("#nav-productos").html("");	
		$.each(data,function(index,value){
			$("#nav-productos").append("<a class='dropdown-item' id='"+value.IdCategoria+"' href='#'>"+value.NomCategoria+"</a>");
		});
			
			$("#nav-productos .dropdown-item, .selec-prod").click(function(){
			
					var IdCat=$(this).attr("id");
					
					window.location.href= "tienda.html?Idcat="+IdCat;
				
		});	
	});
			}
			
			function eliminarProducto(){
		$(".eliminar").click(function(){
		var producto = $(this).parent().parent();
		var CodProducto = parseInt(producto.find("img").attr("id"));
		$.ajax({
			url:urlPrefix + "AsperoEliminarProducto.php",
			method:"POST",
			dataType:"json",
			data:{num:NumPedido,cod:CodProducto}
			
		}).done(function(data){
			$(".totales").html("");
			mostrarCarrito();

		});
	});
	}	
		
	});