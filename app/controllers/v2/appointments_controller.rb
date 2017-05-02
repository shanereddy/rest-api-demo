module V2
  class AppointmentsController < ApplicationController
    before_action :set_nurse
    before_action :set_appointment, only: [:show, :update, :destroy]

    # GET /appointments
    def index
      @appointments = @nurse.appointments.all

      render json: @appointments, each_serializer: V2::AppointmentSerializer
    end

    # GET /appointments/1
    def show
      render json: @appointment, each_serializer: V2::AppointmentSerializer
    end

    # POST /appointments
    def create
      @appointment = @nurse.appointments.new(appointment_params)

      if @appointment.save
        render json: @appointment, status: :created, location: v2_nurse_appointment_path(@nurse.id, @appointment.id)
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /appointments/1
    def update
      if @appointment.update(appointment_params)
        render json: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /appointments/1
    def destroy
      @appointment.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_appointment
        @appointment = @nurse.appointments.find(params[:id])
      end

      def set_nurse
        @nurse = Nurse.find(params[:nurse_id])
      end

      # Only allow a trusted parameter "white list" through.
      def appointment_params
        params.require(:appointment).permit(:nurse_id, :appointment_date, :starttime, :endtime)
      end
  end
end