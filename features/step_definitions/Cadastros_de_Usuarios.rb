Dado("que eu esteja na tela de Cadastros de Usuarios") do                               
    inclui_usuario.load
end                                                                                     
                                                                                        
Quando("inserir todas as informações e confirmar.") do                                  
     $Usuario = 'Incluir'
     inclui_usuario.inserir_informacoes
     
end                                                                                     
                                                                                        
Então("o sistema apresenta as informações do usuário cadastrado.") do  
      expect(inclui_usuario.msg_usuario_criado.text).to eql(CriaUsuarios.class_variable_get(:@@msg_usr_criado))
      puts inclui_usuario.msg_usuario_criado.text
      pega_nome = (inclui_usuario.usua_informacoes.text).split[1..2].join(" ")
      expect(pega_nome).to eql(CriaUsuarios.class_variable_get(:@@valida_nome_usua))
      puts "O usuário foi criado com as seguintes informações: #{inclui_usuario.usua_informacoes.text.split[0..13].join(" ")}"
end     

Quando("não inserir as informações obrigatórias e confirmar.") do
    $Usuario = 'Campos_Brancos' 
    inclui_usuario.sem_informacoes                
end                                                                               
                                                                                  
Então("o sistema alerta o usuário que existem erros a serem corrigidos.") do      
     expect([inclui_usuario.nome.text,inclui_usuario.ultimo_nome.text,inclui_usuario.email.text]).to contain_exactly("","","") 
     puts "Favor corrigir os campos em branco!..."
end    

Quando("não inserir e-mail fora do padrão.") do                                  
      $Usuario = 'Email_Incorreto'
      inclui_usuario.email_invalido
end                                                                              
                                                                                 
Então("o sistema alerta o usuário que o e-mail está inválido.") do 
     pega_texto = (inclui_usuario.msg_email_invalido.text).split(".").drop(6).join(".")
     puts pega_texto
end                                                                              


                                                                                        
                                                                                        