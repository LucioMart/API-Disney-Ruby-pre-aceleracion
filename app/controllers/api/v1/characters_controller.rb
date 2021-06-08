module Api
    module V1
        #El nombre del controlador debe ser en plural y la clase se debe llamar igual que el controlador.
        class CharactersController < ApplicationController

            before_action :authenticate_user!, except: [:index, :show]
            
            def index
                personajes = Character.order('created_at');
                render json: {
                    status: 'EXITOSO',
                    message: 'Personajes cargados',
                    data: personajes
                }, status: :ok
            end  
            
            def show
                personaje = Character.find(params[:id])
                render json: {
                    status: 'EXITOSO',
                    message: 'Personaje cargado',
                    data: personaje    
                }, status: :ok
            end

            def create
                personaje = Character.new(character_params)
                if personaje.save
                    render json: {
                        status: 'Exitoso',
                        message: 'Perdonaje creado',
                        data: personaje
                    }, status: :ok
                else 
                    render json: {
                        status: 'Exitoso',
                        message: 'Personaje no Creado',
                        data: personaje.errors
                    }, status: :unprocessable_entity
                end            
            end

            def destroy
                personaje = Character.find(params[:id])
                if personaje.destroy
                    render json: {
                        status: 'EXITOSO',
                        message: 'Personaje eliminado',
                        data: personaje
                    }, status: :ok
                else 
                    render json: {
                        status: 'FALLIDO',
                        message: 'Personaje NO BORRADO',
                        data: personaje.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                personaje = Character.find(params[:id])
                if personaje.update(character_params)
                    render json: {
                        status: 'EXITOSO',
                        message: 'Personaje actualizado',
                        data: personaje
                    }, status: :ok
                else 
                    render json: {
                        status: 'FALLIDO',
                        message: 'Personaje NO ACTUALIZADO',
                        data: personaje.errors
                    }, status: :unprocessable_entity
                end
            end

            private
            def character_params
                params.permit(:name, :year, :weigh, :story, :picture)
            end    

        end        
    end
end