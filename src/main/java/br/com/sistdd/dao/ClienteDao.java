package br.com.sistdd.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.sistdd.model.Cliente;

@RequestScoped
public class ClienteDao{
	
	private final EntityManager em;
	
	public ClienteDao() {
		this(null);
	}

	@Inject
	public ClienteDao(EntityManager entityManager){
		this.em = entityManager;
	}
	
	public boolean existe(Cliente cliente) {
		return !em.createQuery("select c from Cliente c where c.nome = "
			+ ":nome and c.telefone = :telefone", Cliente.class)
			.setParameter("nome", cliente.getNome())
			.setParameter("telefone", cliente.getTelefone())
			.getResultList().isEmpty();
	}

	public void adicionaCliente(Cliente cliente) {
		em.persist(cliente);
	}
	
	public Cliente buscarPorId(Long id) {
		return em.find(Cliente.class, id);
	}
	
	public void atualizar(Cliente cliente) {
		em.merge(cliente);
	}
	
	public void excluir(Cliente cliente) {
		Cliente clienteRemocao = this.buscarPorId(cliente.getId());
		em.remove(clienteRemocao);
	}	
	
	@SuppressWarnings("unchecked")
	public List<Cliente> listaCliente() {
		return em.createQuery("select c from Cliente c").getResultList();
	}

}
