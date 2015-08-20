<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>formularioLogin.jsp</title>
</head>
<body>
	<div class="container">
		<header class="row">
        	<h1>Login</h1>
   		</header>
		<div class="row">
			<div role="main" class="col-md-6 col-md-push-3">
			      <form class="form-signin" action="<c:url value='/login/autentica' />"  method="post">
			        <label for="inputNome" class="sr-only">Usuário</label>
			        <input type="text" id="inputUsuario" class="form-control" name="usuario.nome" placeholder="Login" required autofocus>
			        <br>
			        <label for="inputPassword" class="sr-only">Senha</label>
			        <input type="password" id="inputPassword" class="form-control" name="usuario.senha" placeholder="Senha" required>
			       	<br>
			        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			        <br>
			        <a class="btn btn-success" href="${linkTo[UsuarioController].formUsuario()}" role="button">Novo Usuário</a>
			        <a class="btn btn-primary" href="${linkTo[UsuarioController].listaUsuario()}" role="button">Usuários</a>
			      </form>
		    </div> 
		</div>
		<footer class="row">
			<c:forEach items="${errors}" var="erro" >
				<div class="alert alert-danger" role="alert"><c:out value="${erro.message}"/></div>
			</c:forEach>
    	</footer>
    </div>
<script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
</body>
</html>