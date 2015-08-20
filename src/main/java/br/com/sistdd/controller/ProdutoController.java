package br.com.sistdd.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.sistdd.dao.ProdutoDao;
import br.com.sistdd.model.Produto;
import br.com.sistdd.rules.LogadoRule;

@Controller
@CustomBrutauthRules(LogadoRule.class)
public class ProdutoController {
	
	@Inject private Result result;
	@Inject private ProdutoDao dao;
	@Inject private Validator validator;
	
	@Get 
	public void lista(){
		result.include("produtoList", dao.lista());
	}

	@Get 
	public void listaXML(){
		List<Produto> lista = dao.lista();
		result.use(Results.xml()).from(lista).serialize();
	}
	
	@Get 
	public void listaJson(){
		List<Produto> lista = dao.lista();
		result.use(Results.json()).from(lista).serialize();
	}
	
	@Get
	public void form(){
	}
	
	@Post
	public void adiciona(Produto produto){	
		validator.check(!produto.getNome().isEmpty(), new I18nMessage("produto.nome", "produto.vazio"));
		validator.onErrorForwardTo(this).form();
		dao.adiciona(produto);
		result.include("mensagem", "Produto Adicionado com Sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Get("/produto/editar/{produto.id}")
	public Produto editar(Produto produto){
		return dao.buscarPorId(produto.getId());
	}
	
	@Put("/produto/update")
	public void update(Produto produto) {
		dao.atualizar(produto);
		result.redirectTo(this).ver(produto);
	}
	
	@Delete("/produto/{produto.id}")
	public void remove(Produto produto) {
		dao.excluir(produto);
		result.include("mensagem", "Produto Removido com Sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Get("/produto/ver/{produto.id}")
	public Produto ver(Produto produto) {
		return dao.buscarPorId(produto.getId());
	}
	
	
}
