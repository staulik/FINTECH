class ListaUsuarios < SitePrism::Page
    set_url 'https://automacaocombatista.herokuapp.com/users/new'

    #Formulário
    element :buscar, 'td[class="material-icons"]' 
    element :editar, 'td[class="material-icons"]' 
    element :remover, 'td[class="material-icons"]' 
 

    #Botões Internos
    element :botao_novo_usuario, 'button[class="btn waves-light green"]' 
    element :botao_voltar, 'button[class="btn waves-light red"]' 
     

   end
    
