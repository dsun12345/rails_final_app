class ArtworksController < ApplicationController
    before_action :verify_user_is_authenticated

    def index 
        
        @museum = Museum.find_by(id: params[:museum_id])
        @artworks = Artwork.all.where(museum_id: params[:museum_id])
    end 


    def new
        @museum = Museum.find_by(id: params[:museum_id])
        @artwork = Artwork.new 
    end 

    def create
        @artwork = Artwork.new(artwork_params)
        @artwork.user_id = current_user.id
        @artwork.museum_id = params[:museum_id]
        if @artwork.save
            redirect_to museum_path(@artwork.museum_id)
        else
            redirect_to new_museum_artwork_path
        end 
    end 


    def show 
        @artwork = Artwork.find_by(id: params[:id])
        @museum = Museum.find_by(id: params[:museum_id])
        if @artwork
            render :show
        else
            redirect_to museum_artworks_path(@museum, @artwork)
        end 
    end 

    def edit
        @artwork = Artwork.find_by(id: params[:id])
        @museum = Museum.find_by(id: params[:museum_id])
        if @artwork
            render :edit
        else
            redirect_to museum_artwork_path(@museum, @artwork)
        end 
    end 

    def update 
        @artwork = Artwork.find_by(id: params[:id])
        @museum = Museum.find_by(id: params[:museum_id])
        if @artwork
            @artwork.update(artwork_params)
            redirect_to museum_artwork_path(@museum, @artwork)
        else
            redirect_to museum_artwork_path(@museum, @artwork)
        end 
    end 
    

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        @museum = Museum.find_by(id: params[:museum_id])
        if @artwork
            @artwork.destroy
            redirect_to museum_path(@museum)
        else
            redirect_to root_path
        end
    end 

    private 
    
    def artwork_params
        params.require(:artwork).permit(
            :title,
            :artist,
            :museum_id
        )
    end 

end 