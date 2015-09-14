<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="ls-theme-green">
  <head>
    <title>SisTDD - formPedido.jsp</title>

    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Insira aqui a descrição da página.">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/locastyle.css">
    <link rel="icon" sizes="192x192" href="<%=request.getContextPath()%>/images/ico-boilerplate.png">
    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/ico-boilerplate.png">
  </head>
  <body>
    <div class="ls-topbar">

      <!-- Notification bar -->
      <div class="ls-notification-topbar">
        <!-- User details -->
        <div data-ls-module="dropdown" class="ls-dropdown ls-user-account">
          <a href="#" class="ls-ico-user">
          	Usuário Logado:	${usuarioLogado.usuario.nome}
          </a>
          <nav class="ls-dropdown-nav ls-user-menu">
            <ul>
              <li><a href="${linkTo[UsuarioController].logout()}">Logout</a></li>
            </ul>
          </nav>
        </div>
      </div>

      <span class="ls-show-sidebar ls-ico-menu"></span>

      <!-- Nome do produto/marca -->
      <h1 class="ls-brand-name"><a class="ls-ico-screen" href="#">SisTDD</a></h1>
    </div>

    <main class="ls-main ">
      <div class="container-fluid">
        <h1 class="ls-title-intro ls-ico-home">Adicionar Pedido</h1>
          <section class="container">
                <div class="container">
                	<form action="<c:url value='/pedido/adicionaPedido' />"  method="post" class="ls-form row">
					  <fieldset>
						  <label class="ls-label col-md-3">
						    <b class="ls-label-text">Cliente</b>
						      <select class="form-control" name="pedido.cliente.id" id="selCliente" required>
	                             <option value="0"></option>
	                             <c:forEach var="cliente" items="${clienteList}">
	                                   <option value="${cliente.id}">${cliente.nome}</option>
	                             </c:forEach>
	                          </select>
						  </label>
						  <label class="ls-label col-md-3">
						    <b class="ls-label-text">Produto</b>
						       <select multiple class="form-control" name="produtos" id="selProduto" required>
	                             <c:forEach var="produto" items="${produtoList}">
	                                   <option value="${produto.id}">${produto.nome}</option>
	                             </c:forEach>
	                           </select>
						  </label>
					  </fieldset>
					  <div class="ls-actions-btn">
						  <button type="submit" class="ls-btn-primary ls-ico-checkmark">Salvar</button>
						  <a class="ls-btn-danger ls-ico-close" href="${linkTo[PedidoController].listaPedido()}" >Cancelar</a>
					  </div>
					</form>
                </div> <!-- /container -->
            </section>
      </div>
	  <c:forEach items="${errors}" var="erro" >
			<div class="ls-alert-danger" role="alert"><c:out value="${erro.message}"/></div>
	  </c:forEach>
    </main>

    <aside class="ls-sidebar">
      <!-- Defails of user account -->
      <div data-ls-module="dropdown" class="ls-dropdown ls-user-account">
        <a href="#" class="ls-ico-user">
        	Usuário Logado:	${usuarioLogado.usuario.nome}
        </a>
        <nav class="ls-dropdown-nav ls-user-menu">
            <ul>
              <li><a href="${linkTo[UsuarioController].logout()}">Logout</a></li>
            </ul>
          </nav>
      </div>

      <nav class="ls-menu">
        <ul>
          <li><a href="${linkTo[ClienteController].listaCliente()}" class="ls-ico-users">Clientes</a></li>
        </ul>
        <ul>
      	  <li><a href="${linkTo[ProdutoController].lista()}" class="ls-ico-cart">Produtos</a></li>
        </ul>
      </nav>
    </aside>

    <script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/locastyle.js"></script>
  </body>
</html>
