class UsersController < ApplicationController

    #module Api
      
        #module V1

            before_action :authorize, only: [:auto_login] #se ejecuta primero, solicita autorizaciòn, especificamente auto_login

            def show
                user = User.find(params[:id]) #busca en la db tabla user, el id que se especifica.
                render json: user
            end

            def create
                user = User.create(user_params) #se crea una instancia de usuario con los parametros validos, declarados en user_params
                if user.valid? #se valida si existe
                user = user 
                token = JWT.encode({user_id: user.id}, secret, 'HS256')#si es valido, se genera el token para esa instancia
                render json: {user: user, token: token}
                else
                render json: {errors: user.errors.full_messages}
                end
            end

            def login
                @user = User.find_by(email: params[:email]) #se busca la instacia, por el atributo email
            
                if @user && @user.authenticate(params[:password])# se verifica si la instacia anterior, posee un contraseña igual a la almacenada
                token = encode_token({user_id: @user.id})# Si es true, se genera el token
                render json: {user: @user, token: token}# se renderiza la instancia con el token
                else
                render json: {error: "email o password incorrectos"}#Si es falso, se renderiza un error.
                end
            end
            
            
            def auto_login # devolvera un @user variable global que es accesible
                render json: @user
            end

            def update
                user = User.find(params[:id])#busca por id una instancia de usuario y lo almacena en una variables
                user.update(user_params)# se actualiza los datos correspondiente
                render json: user # se renderiza al usuario actualizado
            end

            def destroy
                user = User.find(params[:id]) #Se busca por id la instancia
                user.destroy #metodo para eliminar
            end

            private
            def user_params
                params.permit(:email, :password) #atributos permitidos para su modificaciòn.
            end

        end

    #end

#end
