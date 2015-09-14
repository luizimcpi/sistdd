<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="ls-theme-green">
  <head>
    <title>SisTDD - lista.jsp</title>

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
        <h1 class="ls-title-intro ls-ico-cart">Produtos</h1>
          <section class="container">
                <div class="container">
                        <div class="row">
                           <div class="col-md-11">
                            <p>
                              <a href="${linkTo[ProdutoController].form()}" class="ls-btn-primary ls-ico-cart">Cadastrar</a>
                            </p>
                            <table class="ls-table ls-table-striped ls-sm-space">
                              <thead>
                                <tr>
                                 		<th>Nome</th>
										<th>Valor</th>
										<th>Consultar</th>
										<th>Alterar</th>
										<th>Remover</th>
                                </tr>
                              </thead>
                              <tbody>
                              	<c:forEach items="${produtoList}" var="produto">
			                         <tr>
			                             <td>${produto.nome}</td>
			                             <td>R$: ${produto.valor}</td>
			                             <td><a class="ls-btn-primary ls-ico-search" href="${linkTo[ProdutoController].ver()}${produto.id}">Consultar</a></td>
			                             <td><a class="ls-btn-dark ls-ico-pencil" href="${linkTo[ProdutoController].editar()}${produto.id}" role="button">Alterar</a></td>
			                             <td>
									       <form action="<c:url value="/produto/${produto.id}"/>" method="POST">
									         <button class="ls-btn-danger ls-ico-close" onclick="return confirm('Deseja realmente remover este produto?');" name="_method" 
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
                </div> <!-- /container -->
            </section>
      </div>
	  <c:if test="${mensagem != '' && !empty mensagem}">
		<div class="ls-alert-success"><strong><c:out value="${mensagem}"/></strong></div>
	  </c:if>
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
      	  <li><a href="${linkTo[PedidoController].listaPedido()}" class="ls-ico-docs">Pedidos</a></li>
        </ul>
      </nav>
    </aside>

    <script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/locastyle.js"></script>
  </body>
</html>
