package com.lhsedev.sistdd.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import com.lhsedev.sistdd.model.Produto;

@RequestScoped
public class ProdutoDao {
	
	private final EntityManager em;
	
	public ProdutoDao() {
		this(null);
	}

	@Inject
	public ProdutoDao(EntityManager entityManager){
		this.em = entityManager;
	}
	
	public void adiciona(Produto produto) {
		em.persist(produto);
	}

	public Produto buscarPorId(Long id) {
		return em.find(Produto.class, id);
	}
	
	public void atualizar(Produto produto) {
		em.merge(produto);
	}
	
	public void excluir(Produto produto) {
		Produto produtoRemocao = this.buscarPorId(produto.getId());
		em.remove(produtoRemocao);
	}	
	
	
	@SuppressWarnings("unchecked")
	public List<Produto> lista() {
		return em.createQuery("select p from Produto p").getResultList();
	}
}