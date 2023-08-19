class CatsController < ApplicationController

    def index
        @cats = Cat.all

        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])

        render json: @cat # replace with show view 
    end

    def new
        render :new
    end

    def create

        @cat = Cat.new(cat_params)

        if @cat.save
            redirect_to cat_url(@cat)
        else
            #replace with new view
            render json: @cat.errors.full_messages, status: :unprocessable_entity
        end

    end

    
    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    def update

        @cat = Cat.find_by(id: params[:id])

        if @cat.update
            redirect_to cat_url(@cat)
        else
            render :edit
        end

    end

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end