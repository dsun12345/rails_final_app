class ArtworksController < ApplicationController

    def index 
        @artworks = Artwork.all
    end 


    def new
       
    end 

    def create
 
    end 


    def show 
 
    end 

    def edit
 
    end 

    def update 
    
    end 
    

    def destroy
    
    end 


    private 
    
    def artwork_params
        params.require(:playlist).permit(
            :title,
            :artist,
            :year_published,
            :museum_id,
            :user_id
        )
    end 

end 