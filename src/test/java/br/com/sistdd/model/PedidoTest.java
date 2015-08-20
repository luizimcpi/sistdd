/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.sistdd.model;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.sistdd.controller.PedidoController;

public class PedidoTest {
	List<Produto> produtosAdd = new ArrayList<Produto>();
	PedidoController pedidoController = new PedidoController();
    
    public PedidoTest() {
    }
    @Before
    public void criaObjetosEVariaveisNecessarias(){
        Produto produto = new Produto();
        produto.setNome("Pizza Calabresa");
        produto.setValor(15.00);
        produtosAdd.add(produto);
        produto = new Produto();
        produto.setNome("Pizza Queijo");
        produto.setValor(20.00);
        produtosAdd.add(produto);
        produto = new Produto();
        produto.setNome("Coca-Cola");
        produto.setValor(5.00);
        produtosAdd.add(produto);
    }
    @Test
    public void testTotalDoPedido() {
    	Double resultadoEsperado = 40.0;
    	assertEquals(resultadoEsperado, pedidoController.calculaValorTotalDoPedido(produtosAdd));
    }
    
}
