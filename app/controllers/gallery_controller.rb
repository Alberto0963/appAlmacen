class GalleryController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_gallery, only: [:update, :show, :destroy]

    #GET /gallery  
    def index
        @gallery = Gallery.all 
        render json: @gallery, status: :ok
    end

    #GET /gallery/{id}
    def show
        render json: @gallery, status: :ok
    end

    #POST /gallery
    def create
        @gallery = Gallery.new(gallery_params)
        if @gallery.save
            render json: @gallery, status: :ok
        else
            render json: { errors: @gallery.errors.full_messages },
                    status: :unprocessable_entity
        end
    end     

    #PUT /gallery/{id}
    def update
        if @gallery.update(gallery_params)
            render json: {message: "car updated", status: :ok}
        else  
            render json: {errors: @gallery.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    #DELETE /gallery/{id}
    def destroy
        @gallery.destroy
    end

    private
        def gallery_params
            params.permit(:idProduct,:image)
        end

        def set_gallery
            @clientSupplier = Gallery.find params[:id]
        end
end
