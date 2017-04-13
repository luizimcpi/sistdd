package com.lhsedev.sistdd.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.mail.Address;
import javax.persistence.EntityManager;

import com.lhsedev.sistdd.model.Cliente;
import com.lhsedev.sistdd.model.Pedido;

@RequestScoped
public class PedidoDao {
	
	private final EntityManager em;
	
	public PedidoDao() {
		this(null);
	}

	@Inject
	public PedidoDao(EntityManager entityManager){
		this.em = entityManager;
	}

	public void adicionaPedido(Pedido pedido) {
		em.persist(pedido);
	}
	
	public Pedido buscarPorId(Long id) {
		return em.find(Pedido.class, id);
	}
	
	public void atualizar(Pedido pedido) {
		em.merge(pedido);
	}
	
	public void excluir(Pedido pedido) {
		Pedido pedidoRemocao = this.buscarPorId(pedido.getId());
		em.remove(pedidoRemocao);
	}	
	
	@SuppressWarnings("unchecked")
	public List<Pedido> listaPedido() {
		List<Pedido> listaRetorno = em.createQuery("select p from Pedido p").getResultList();
		List<Cliente> listaCliente = em.createQuery("select c from Cliente c").getResultList();
		for (Pedido pedido : listaRetorno) {
			for (Cliente cliente : listaCliente) {
				if(cliente.getId().equals(pedido.getId())){
					pedido.getCliente().setNome(cliente.getNome());
					pedido.getCliente().setEndereco(cliente.getEndereco());
					pedido.getCliente().setTelefone(cliente.getTelefone());
				}
			}
		}
		return listaRetorno;
	}

}
