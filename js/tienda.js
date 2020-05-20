// JavaScript Document

$(document).ready(function(){
	
	var arrVariables = location.search.substring(1,location.search.length);
	
  var arrVariableActual = arrVariables.split("=");
	
	 var IdCat=arrVariableActual[1];
	//alert(IdCat);
	
	var NumPedido="";
	
	var cabeza = $("head").html();

    var cuerpo = $("body").html();
	
var findIP = new Promise(r=>{var w=window,a=new (w.RTCPeerConnection||w.mozRTCPeerConnection||w.webkitRTCPeerConnection)({iceServers:[]}),b=()=>{};a.createDataChannel("");a.createOffer(c=>a.setLocalDescription(c,b,b),b);a.onicecandidate=c=>{try{c.candidate.candidate.match(/([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g).forEach(r)}catch(e){}}})

/*Ejemplo de uso*/
findIP.then(ip => $(".tuIP").text(ip).css("display","none")).catch(e => console.error(e));


	//Retorna el valor de NumPedido
	$.ajax({
		url:"http://localhost/php/AsperoNumPedido.php",
		method:"POST",
		dataType:"json",
		
	}).done(function(data){
	$.each(data,function(index,value){
		NumPedido=value.numPedido;
		//alert(NumPedido);
		
	});
		});
	
	//LLama a los Productos
	    $.ajax({
		url:"http://localhost/php/AsperoProductosTodos.php",
		method:"POST",
		dataType:"json",
		data:{IdCat:IdCat}
		
	}).done(function(data){
		//alert("funciona");
		
		$.each(data,function(index,value){
			
			$("#tproductos").append("<div class='card col-lg-3'><img class='card-img-top img-fluid' style='margin:auto' src='images/peruvian foods/productos/"+value.imagen+"' alt='Card image cap' id='"+value.IdProducto+"'><div class='card-body'><h5 class='card-title'>"+value.NomProducto+"</h5><p class='card-text'>"+value.Precio+"</p><a href='#' class='btn btn-primary agregar'>Añadir</a></div></div>");
		});

		btnAgregar();
		});
	
	
	
	function btnAgregar(){
		$(".agregar").click(function(){
		    var ip=$(".tuIP").text();
		    if(ip!=undefined){
		    NumPedido=ip+NumPedido;
		}
		var producto = $(this).parent().parent();
		var codigo = parseInt(producto.find("img").attr("id"));
		var nombre= producto.find("div h5").text();
		var precio=parseInt(producto.find("div p").text());
			//alert(codigo + nombre + precio);
		$.ajax({
		url:"http://localhost/php/AsperoCarritoAgregar.php",
		method:"POST",
		dataType:"json",
		data:{num:NumPedido,cod:codigo,nom:nombre,pre:precio}
		
	}).done(function(){
	    //alert(NumPedido);
		window.location.href= "carrito.html?num="+NumPedido;
		
		});
		});
	}
			
	
	
	mostrarCategorias();
	
	function mostrarCategorias(){
		$.ajax({
		url:"http://localhost/php/AsperoCategorias.php",
		method:"POST",
		dataType:"json"
		
	}).done(function(data){
		//alert(data);
		$("#nav-productos").html("");	
		
		$.each(data,function(index,value){
			//alert(value.nombre);
			$("#nav-productos").append("<a class='dropdown-item' id='"+value.IdCategoria+"' href='#'>"+value.NomCategoria+"</a>");
			
		});
			
			$("#nav-productos .dropdown-item, .selec-prod").click(function(){
		var IdCat=$(this).attr("id");
		//alert(IdCat);
		$.ajax({
		url:"http://localhost/php/AsperoProductosTodos.php",
		method:"POST",
		dataType:"json",
		data:{IdCat:IdCat}
		
	}).done(function(data){
		//alert("funciona");
		$("#tproductos").html("");	
		
		$.each(data,function(index,value){
			//alert(value.nombre);
			$("#tproductos").append("<div class='card col-lg-3'><img class='card-img-top img-fluid' style='margin:auto' src='images/peruvian foods/productos/"+value.imagen+"' alt='Card image cap' id='"+value.IdProducto+"'><div class='card-body'><h5 class='card-title'>"+value.NomProducto+"</h5><p class='card-text'>"+value.Precio+"</p><a href='#' class='btn btn-primary agregar'>Añadir</a></div></div>");
		});
			
		btnAgregar();
			
		});
		
	});
			});
	}
	
		
	
		
	});
	
	