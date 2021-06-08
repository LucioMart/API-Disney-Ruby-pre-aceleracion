module Api
    module V1
        #El nombre del controlador debe ser en plural y la clase se debe llamar igual que el controlador.
        class MoviesController < ApplicationController

            before_action :authenticate_user!, except: [:index, :show]
            
            def index
                peliculas = Movie.order('created_at');
                render json: {
                    status: 'EXITOSO',
                    message: 'Peliculas cargadas',
                    data: peliculas
                }, status: :ok
            end  
            
            def show
                pelicula = Movie.find(params[:id])
                render json: {
                    status: 'EXITOSO',
                    message: 'Pelicula cargada',
                    data: pelicula    
                }, status: :ok
            end

            def create
                pelicula = Movie.new(movie_params)
                if pelicula.save
                    render json: {
                        status: 'Exitoso',
                        message: 'Pelicula creada',
                        data: pelicula
                    }, status: :ok
                else 
                    render json: {
                        status: 'Exitoso',
                        message: 'Pelicula no Creada',
                        data: pelicula.errors
                    }, status: :unprocessable_entity
                end            
            end

            def destroy
                pelicula = Movie.find(params[:id])
                if pelicula.destroy
                    render json: {
                        status: 'EXITOSO',
                        message: 'Pelicula eliminada',
                        data: pelicula
                    }, status: :ok
                else 
                    render json: {
                        status: 'FALLIDO',
                        message: 'Pelicula NO BORRADa',
                        data: pelicula.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                pelicula = Movie.find(params[:id])
                if pelicula.update(movie_params)
                    render json: {
                        status: 'EXITOSO',
                        message: 'Pelicula actualizada',
                        data: pelicula
                    }, status: :ok
                else 
                    render json: {
                        status: 'FALLIDO',
                        message: 'Pelicula NO ACTUALIZADA',
                        data: pelicula.errors
                    }, status: :unprocessable_entity
                end
            end

            private
            def movie_params
                params.permit(:title, :gender, :qualification, :picture)
            end    

        end        
    end
end