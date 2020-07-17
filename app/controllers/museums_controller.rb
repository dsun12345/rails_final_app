class MuseumsController < ApplicationController

    def index 
        @museums = Museum.all
    end 


    def new
        @museum = Museum.new
    end 

    def create
        @museum = Museum.new(museum_params)
        if @museum.save
            redirect_to museum_path(@museum)
        else
            render :new
        end 
    end 


    def show 
        @museum = Museum.find_by(id: params[:id])
        if @museum
            render :show
        else
            redirect_to museums_path
        end 
    end 

    def edit
        @museum = Museum.find_by(id: params[:id])
        if @museum
            render :edit
        else
            redirect_to museums_path
        end 
    end 

    def update 
        @museum = Museum.find_by(id: params[:id])
        if @museum
            @museum.update(museum_params)
            redirect_to museum_path(@museum)
        else
            redirect_to museum_path(@museum)
        end 
    end 
    

    def destroy
        @museum = Museum.find_by(id: params[:id])
        if @museum
            @museum.destroy
            redirect_to museums_path
        else
            redirect_to museum_path(@museum)
        end
    end 

    private 

    def museum_params
        params.require(:museum).permit(
            :name,
            :location
        )
    end 

end 