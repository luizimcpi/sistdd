<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>listaUsuario.jsp</title>
</head>
<body>
	<div class="container">
		<header class="row">
			<a class="btn btn-warning" href="${linkTo[LoginController].formularioLogin()}" role="button">Login</a>
			<a class="btn btn-primary" href="${linkTo[UsuarioController].formUsuario()}" role="button">Adicionar</a>
   		</header>
   		<div class="row">
			<table class="table table-stripped table-hover table-bordered">
				<thead>
					<tr>
						<th width="70%">Nome</th>
						<th>Consultar</th>
						<th>Alterar</th>
						<th>Remover</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${usuarioList}" var="usuario">
						<tr>
							<td>${usuario.nome}</td>
							<td>
								<a class="btn btn-default" href="${linkTo[UsuarioController].verUsuario()}${usuario.id}" role="button">Consultar</a>
							</td>
							<td>
								<a class="btn btn-primary" href="${linkTo[UsuarioController].editarUsuario()}${usuario.id}" role="button">Alterar</a>
							</td>
							<td>
								<form action="<c:url value="/usuario/${usuario.id}"/>" method="POST">
						         <button class="btn btn-danger" onclick="return confirm('Deseja realmente remover esse usuário?');" name="_method" 
						           value="DELETE">
						           Remover
						         </button>
						       </form>
							</td>
						</tr>			
					</c:forEach>
				</tbody>
			</table>
		</div>
		<footer class="row">
       		<c:if test="${mensagem != '' && !empty mensagem}">
			<div class="alert alert-success" role="alert"><c:out value="${mensagem}"/></div>
		</c:if>
   		</footer>
	</div>
</body>
</html>