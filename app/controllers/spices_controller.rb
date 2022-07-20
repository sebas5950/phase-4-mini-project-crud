class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_error
    #GET /spices
   def index
    spices = Spice.all
    render json: spices
   end
   #GET /spices/:id
#    def show
#     spice = find_spice
#     render json: spice
#    end
   #POST /spices
   def create
    spice = Spice.create(strong_params)
    render json: spice, status: :created
   end
   #PATCH /spices/:id
   def update
    spice = find_spice
    spice.update(strong_params)
    render json: spice
   end
   #DELETE /spices/:id
   def destroy
    spice = find_spice
    spice.destroy
    head :no_content
   end

   private

   def strong_params
    params.permit(:title, :image, :description, :notes, :rating)
   end

   def render_error
    render json: {message: "spice not found"}, status: :not_found
   end

   def find_spice
    Spice.find(params[:id])
   end



end
