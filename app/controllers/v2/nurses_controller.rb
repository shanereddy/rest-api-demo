module V2
  class NursesController < ApplicationController
    before_action :set_nurse, only: [:show, :update, :destroy]

    # GET /nurses
    def index
      @nurses = Nurse.all

      render json: @nurses, each_serializer: V2::NurseSerializer
    end

    # GET /nurses/1
    def show
      render json: @nurse, each_serializer: V2::NurseSerializer
    end

    # POST /nurses
    def create
      @nurse = Nurse.new(nurse_params)

      if @nurse.save
        render json: @nurse, status: :created, location: v2_nurse_appointment_path(@nurse.id)
      else
        render json: @nurse.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /nurses/1
    def update
      if @nurse.update(nurse_params)
        render json: @nurse
      else
        render json: @nurse.errors, status: :unprocessable_entity
      end
    end

    # DELETE /nurses/1
    def destroy
      @nurse.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nurse
        @nurse = Nurse.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nurse_params
        params.require(:nurse).permit(:name, :region, :active)
      end
  end
end
