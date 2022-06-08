class AppointmentsController < ApplicationController
  
  def index
    render json: Appointment.all, status: :ok
  end

  def show
    appointment = Appointment.find(params[:id])
    render json: appointment, status: :ok
  end

  def create
    render json: Appointment.create!(appointment_params), status: :created
  end

  def update
    appointment = Appointment.find(params[:id])
    render json: appointment.update!(appointment_params), status: :created
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:start_date, :end_date, :start_time, :end_time)
  end
end