class MuseumsController < ApplicationController

    def index 
        @museums = Museum.all
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

    def museum_params
        params.require(:museum).permit(
            :title,
            :location
        )
    end 

end 