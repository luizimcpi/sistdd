package br.com.sistdd.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.sistdd.model.Usuario;

@RequestScoped
public class UsuarioDao{
	
	private final EntityManager em;
	
	public UsuarioDao() {
		this(null);
	}

	@Inject
	public UsuarioDao(EntityManager entityManager){
		this.em = entityManager;
	}
	
	
	public boolean existe(Usuario usuario) {
		return !em.createQuery("select u from Usuario u where u.nome = "
			+ ":nome and u.senha = :senha", Usuario.class)
			.setParameter("nome", usuario.getNome())
			.setParameter("senha", usuario.getSenha())
			.getResultList().isEmpty();
	}

	public void adicionaUsuario(Usuario usuario) {
		em.persist(usuario);
	}
	
	public Usuario buscarPorId(Long id) {
		return em.find(Usuario.class, id);
	}
	
	public void atualizar(Usuario usuario) {
		em.merge(usuario);
	}
	
	public void excluir(Usuario usuario) {
		Usuario usuarioRemocao = this.buscarPorId(usuario.getId());
		em.remove(usuarioRemocao);
	}	
	
	@SuppressWarnings("unchecked")
	public List<Usuario> listaUsuario() {
		return em.createQuery("select u from Usuario u").getResultList();
	}

}
