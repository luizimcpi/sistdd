package com.lhsedev.sistdd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.lhsedev.sistdd.dao.ClienteDao;
import com.lhsedev.sistdd.dao.PedidoDao;
import com.lhsedev.sistdd.dao.ProdutoDao;
import com.lhsedev.sistdd.model.Cliente;
import com.lhsedev.sistdd.model.Pedido;
import com.lhsedev.sistdd.model.Produto;
import com.lhsedev.sistdd.rules.LogadoRule;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;

@Controller
@CustomBrutauthRules(LogadoRule.class)
public class PedidoController {
	
    @Inject private PedidoDao pedidoDao;
    @Inject private Result result;
    @Inject private ClienteDao clienteDao;
    @Inject private ProdutoDao produtoDao;
    private List<Produto> produtosAdd = null;
    private String mensagem = "";
    
    @Get
	public void listaPedido(){
        result.include("pedidoList", pedidoDao.listaPedido());
	}
	
	@Get
	public void formPedido(){
        result.include("produtoList", produtoDao.lista());
	    result.include("clienteList", clienteDao.listaCliente());
	}
	
	@Post
	public void adicionaPedido(Pedido pedido, List<String> produtos){
		if(produtos != null && !produtos.isEmpty()){
			produtosAdd = new ArrayList<Produto>();
			for (String idProduto : produtos) {
				Produto produto = produtoDao.buscarPorId(Long.parseLong(idProduto, 10));
				produtosAdd.add(produto);
			}
			Cliente cliente = clienteDao.buscarPorId(pedido.getCliente().getId());
			pedido.setCliente(cliente);
			pedido.setProdutos(produtosAdd);
			pedido.setValorTotal(this.calculaValorTotalDoPedido(produtosAdd));
			pedidoDao.adicionaPedido(pedido);
			mensagem = "Pedido Adicionado com Sucesso!";
		}else{
			mensagem = "Selecione um ou mais produtos!";
		}
		result.include("mensagem", mensagem);
		result.redirectTo(this).listaPedido();
	}
	
	@Delete("/pedido/{pedido.id}")
	public void remove(Pedido pedido) {
		pedidoDao.excluir(pedido);
		result.include("mensagem", "Pedido Removido com Sucesso!");
		result.redirectTo(this).listaPedido();
	}
	
	@Get("/pedido/verPedido/{pedido.id}")
	public Pedido verPedido(Pedido pedido) {
            result.include("clienteList", clienteDao.listaCliente());
            return pedidoDao.buscarPorId(pedido.getId());
	}
	
	public Double calculaValorTotalDoPedido(List<Produto> produtosAdd) {
            Double valorTotal = 0.0;
            if(produtosAdd != null && !produtosAdd.isEmpty()){    
                for (Produto produto : produtosAdd) {
                        valorTotal += produto.getValor();
                }
            }
            return valorTotal;
	}
	
}
