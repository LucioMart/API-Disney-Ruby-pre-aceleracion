class ApplicationController < ActionController::API
  
    #module Api
      
        #module V1
  
            before_action :authorized #ante una solicitud a esta API, el metodo authorized, siempre se lamarà primero.

            def encode_token(payload) #se nevìa un objeto como argumento
                JWT.encode(payload, 's3cr3t') #encode, genera el token. Toma al objeto y una cadena, como argumento
            end

            def auth_header
                # { Authorization: 'Bearer <token>' }
                request.headers['Authorization'] #recupera la respuesta del encabezado
            end

            def decoded_token
                if auth_header #si contiene datos
                token = auth_header.split(' ')[1] # se separa la informacion en un array, y se toma el token que se encuentra en la posiciòn 1.
                # header: { 'Authorization': 'Bearer <token>' }
                begin
                    JWT.decode(token, 's3cr3t', true, algorithm: 'HS256') #devuelve una matriz
                rescue JWT::DecodeError
                    nil
                end
                end
            end

            def logged_in_user #
                if decoded_token
                user_id = decoded_token[0]['user_id'] #se recupera el dato de la posiciòn 0, un objeto con la clave 'user_id'
                @user = User.find_by(id: user_id)#se busca si existe una instancia con ese id.
                end
            end

            def logged_in? #Se verifica si el usuario esta conectado o no
                !!logged_in_user
            end

            def authorized # verifica si un usuario esta autorizado
                render json: { message: 'Debe iniciar Sessiòn' }, status: :unauthorized unless logged_in?
            end

        end

    #end

#end

