<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>verUsuario.jsp</title>
</head>
<body>
	<div class="col-md-4">
		<a class="btn btn-success" href="${linkTo[UsuarioController].listaUsuario()}" role="button">Voltar</a>
	</div>
	<div class="col-md-8">
	  <div class="form-group">
	    <label for="inputNome">Nome:</label>
	   <c:out value="${usuario.nome}"/>
	  </div>
	</div>
<script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
</body>
</html>