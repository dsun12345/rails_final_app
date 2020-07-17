class ArtworksController < ApplicationController

    def index 
        @artworks = Artwork.all
    end 


    def new
        @artwork = Artwork.new
    end 

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            redirect_to artwork_path(@artwork)
        else
            render :new
        end 
    end 


    def show 
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            render :show
        else
            redirect_to artworks_path
        end 
    end 

    def edit
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            render :edit
        else
            redirect_to artworks_path
        end 
    end 

    def update 
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            @artwork.update(artwork_params)
            redirect_to artwork_path(@artwork)
        else
            redirect_to artwork_path(@artwork)
        end 
    end 
    

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            @artwork.destroy
            redirect_to artworks_path
        else
            redirect_to artwork_path(@artwork)
        end
    end 

    private 
    
    def artwork_params
        params.require(:artwork).permit(
            :title,
            :artist,
            :museum_id,
            :user_id
        )
    end 

end 