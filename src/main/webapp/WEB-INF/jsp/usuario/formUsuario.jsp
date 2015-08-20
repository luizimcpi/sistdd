<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>formUsuario.jsp</title>
</head>
<body>
	<div class="container">
		 <header class="row">
		 	Usuário
	  	 </header>
		  <div class="row">
			<c:if test="${empty usuario.id}">
	     	<h1>Adicionar Usuário</h1>
				<form action="<c:url value='/usuario/adicionaUsuario' />"  method="post">
				  <div class="form-group">
				    <label for="inputNome">Login</label>
				    <input type="text" class="form-control" name="usuario.nome" value="${usuario.nome}" required>
				  </div>
				  <div class="form-group">
				    <label for="inputValor">Senha</label>
				    <input type="password" class="form-control" name="usuario.senha" value="${usuario.senha}" required>
				  </div>
				  <button type="submit" class="btn btn-default">Salvar</button>
				</form>
			</c:if>
			<c:if test="${not empty usuario.id}">
				<h1>Alterar Usuário</h1>
					<form action="<c:url value="/usuario/update"/>" method="POST">
				      <input type="hidden" name="usuario.id" value="${usuario.id}">
				      <div class="form-group">
					    <label for="inputNome">Login</label>
					  	<input type="text" class="form-control" name="usuario.nome" value="${usuario.nome}" required>
					  </div>
					  <div class="form-group">
					    <label for="inputValor">Senha</label>
					 	<input type="password" class="form-control" name="usuario.senha" value="${usuario.senha}" required>
					  </div>
			         <button class="btn btn-warning" name="_method" value="PUT">
			           Alterar
			         </button>
				  </form>
			</c:if>
		</div>
		 <footer class="row">
			<c:forEach items="${errors}" var="erro" >
				<div class="alert alert-danger" role="alert"><c:out value="${erro.message}"/></div>
			</c:forEach>
		</footer>
	</div>
</body>
</html>