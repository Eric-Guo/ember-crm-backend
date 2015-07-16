class Api::V1::LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :update, :destroy]

  def index
    @leads = Lead.all

    render json: @leads
  end

  def show
    render json: @lead
  end

  def create
    @lead = Lead.new(lead_params)

    if @lead.save
      render json: @lead, status: :created, location: @lead
    else
      render json: @lead.errors, status: :unprocessable_entity
    end
  end

  def update
    @lead = Lead.find(params[:id])

    if @lead.update(lead_params)
      head :no_content
    else
      render json: @lead.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @lead.destroy

    head :no_content
  end

  private

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :email, :phone, :status, :notes)
  end
end
