/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.sistdd.model;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import br.com.sistdd.controller.ClienteController;
//import br.com.sistdd.dao.ClienteDao;
//import static org.mockito.Mockito.*;

/**
 *
 * @author luizH
 */
public class ClienteTest {
    
    public ClienteTest() {
    }

    @Test
    public void testClienteMesmoNome() {
        List<Cliente> listaClientes = new ArrayList<Cliente>();
        Cliente cliente = new Cliente();
        ClienteController clienteControl = new ClienteController();
        cliente.setNome("Teste");
        cliente.setEndereco("Rua Teste, Santos SP");
        cliente.setTelefone("(13)3222-2222");
        listaClientes.add(cliente);
        cliente = new Cliente();
        cliente.setNome("Luiz Henrique");
        cliente.setEndereco("Rua Teste, Santos SP");
        cliente.setTelefone("(13)3222-2222");
        listaClientes.add(cliente);
        String nomeProcura = "Teste";
//        ClienteDao daoFalso = mock(ClienteDao.class);
//        Ensina ao mock a lista que ele deve retornar quando solicitado
//        when(daoFalso.listaCliente()).thenReturn(listaClientes);
        clienteControl.setClientes(listaClientes);
        assertEquals(true, clienteControl.isClienteMesmoNome(nomeProcura));
    }
   
    
}
