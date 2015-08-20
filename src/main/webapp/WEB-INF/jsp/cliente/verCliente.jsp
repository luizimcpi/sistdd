<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>verCliente.jsp</title>
</head>
<body>
<div class="container">
	<header class="row">
		<a class="btn btn-success" href="${linkTo[ClienteController].listaCliente()}" role="button">Voltar</a>
	</header>
	<div class="row">
		<div class="col-md-12">
		  <div class="form-group">
		    <label for="inputNome">Nome:</label>
		   	<c:out value="${cliente.nome}"/>
		  </div>
		  <div class="form-group">
		    <label for="inputTelefone">Telefone:</label>
		   	<c:out value="${cliente.telefone}"/>
		  </div>
		  <div class="form-group">
		    <label for="inputEndereco">Endereço:</label>
		   	<c:out value="${cliente.endereco}"/>
		  </div>
		</div>
	</div>
</div>
<script src="${jsDir}/jquery-2.1.4.min.js"></script>
</body>
</html>