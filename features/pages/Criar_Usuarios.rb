class CriaUsuarios < SitePrism::Page
    set_url 'https://automacaocombatista.herokuapp.com/users/new'

    #Formulário
    element :nome, '#user_name'
    element :ultimo_nome, '#user_lastname'
    element :email, '#user_email'
    element :endereco, '#user_address'
    element :universidade, '#user_university'
    element :profissao, '#user_profile'
    element :genero, '#user_gender'
    element :idade, '#user_age'

    #Botões Internos
    element :criar, 'div[class="actions btn waves-effect green"]' 
    element :botao_voltar, 'button[class="btn waves-light red"]' 

    #Mensagens
    element :msg_usuario_criado, '#notice'
    element :usua_informacoes,  'div[class="col s12 center"]'
    element :msg_email_invalido,'#error_explanation' 
    
   
    #Métodos
    
    def alt_variaveis

        if $Usuario  == 'Incluir'
            @nome             = 'Silvio Automation'
            @ultimo_nome      = 'Tadeu'
            @email            = 'stadeu@fintech.com.br'
            @endereco         = 'rua Caiobas 29 B - Vila Prudente'
            @universidade     = 'PUC' 
            @profissao        =  'Analista de Automação'
            @genero           = 'Masculino'
            @idade            =  '44'
            @@msg_usr_criado   =  'Usuário Criado com sucesso'
            @@valida_nome_usua =  'Silvio Automation'
        elsif $Usuario == 'Alterar'
            @@nome            = 'Silvio Automation alterado'
            @@ultimo_nome     = 'Tadeu - alterado'
            @@email           = 'stadeu@fintech.com.br - alterado'
            @@endereco        = 'rua Caiobas 29 B - Vila Prudente - alterado'
            @@universidade     = 'PUC - alterado' 
            @@profissao       =  'Analista de Testes Automatizados - alterado'
            @@genero          = 'Masculino - alterado'
            @@idade           =  '44  - alterado'
        elsif $Usuario == 'Campos_Brancos'
            @nome             = ''
            @ultimo_nome      = ''
            @email            = ''
        elsif $Usuario == 'Email_Incorreto'
              @nome             = 'Silvio Automation'
              @ultimo_nome      = 'Tadeu' 
              @@email           = 'stadeu@'
        end
    end 

    def inserir_informacoes

        alt_variaveis
        
        if $Usuario == 'Incluir'
           nome.set(@nome) 
           ultimo_nome.set(@ultimo_nome)
           email.set(@email)
           endereco.set(@endereco)
           universidade.set(@universidade)
           profissao.set(@profissao)
           genero.set(@genero)
           idade.set(@idade)
           criar.click
       end
    end
   
    def sem_informacoes

     if $Usuario == 'Campos_Brancos'
        nome.set(@nome) 
        ultimo_nome.set(@ultimo_nome)
        email.set(@email)
        criar.click   
     end
   end

     def email_invalido

        if $Usuario == 'Email_Incorreto'

        alt_variaveis
        
        nome.set(@nome) 
        ultimo_nome.set(@ultimo_nome)
        email.set(@@email)
        criar.click
      end 
  end
end
   