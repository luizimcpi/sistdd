package br.com.sistdd.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Pedido implements Serializable  {
	
    private static final long serialVersionUID =  1L;
    @GeneratedValue @Id
    private Long id;
   
    private Double valorTotal;

	
    @OneToOne
    private Cliente cliente;
    
    @OneToMany(mappedBy = "pedido")
    private List<Produto> produtos;
    
    public Long getId() {
            return id;
    }
    public void setId(Long id) {
            this.id = id;
    }
        
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
	
    public List<Produto> getProdutos() {
            return produtos;
    }
    public void setProdutos(List<Produto> produtos) {
            this.produtos = produtos;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }
	
}
