<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>lista.jsp</title>
</head>
<body>
<div class="container">
	<header class="row">
		<h2>Menu</h2>
	</header>
	<div class="row">
		<div class="col-md-4">
			<div class="btn-group-vertical" role="group">
				<a class="btn btn-primary" href="${linkTo[ProdutoController].lista()}" role="button">Produtos</a>
				<a class="btn btn-primary" href="${linkTo[ClienteController].listaCliente()}" role="button">Clientes</a>
				<a class="btn btn-danger" href="${linkTo[UsuarioController].logout()}" role="button">Logout</a>
			</div>
		</div>
		<div class="col-md-8">
			<a class="btn btn-primary" href="${linkTo[PedidoController].formPedido()}" role="button">Adicionar</a>
			<h3>Lista de Pedidos - Usuário Logado: ${usuarioLogado.usuario.nome}</h3>
			<table class="table table-stripped table-hover table-bordered">
				<thead>
					<tr>
						<th>Número Pedido</th>
                        <th>Nome Cliente</th>
						<th>Valor Pedido</th>
                        <th>Consultar</th>
                        <th>Remover</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pedidoList}" var="pedido">
                         <tr>
                             <td>${pedido.id}</td>
                             <td>${pedido.cliente.nome}</td>
                             <td>R$: ${pedido.valorTotal}</td>
                             <td><a class="btn btn-default" href="${linkTo[PedidoController].verPedido()}${pedido.id}" role="button">Consultar</a></td>
                             <td>
                             	<form action="<c:url value="/pedido/${pedido.id}"/>" method="POST">
						         <button class="btn btn-danger" onclick="return confirm('Deseja realmente remover esse pedido?');" name="_method" 
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
	</div>
	<footer class="row">
		<c:if test="${mensagem != '' && !empty mensagem}">
			<div class="alert alert-success" role="alert"><c:out value="${mensagem}"/></div>
		</c:if>
	</footer>
</div>
</body>
</html>