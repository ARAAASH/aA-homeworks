class CatRentalRequestsController < ApplicationController

  def index

    @cat_request = CatRentalRequest.all
    # fail
    render :index
  end

  def show
    @cat_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_request
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  def approve
    @cat_request = CatRentalRequest.find_by(id: params[:id])
    @cat_request.approve!
    redirect_to cat_rental_requests_url
  end

  def deny
    @cat_request = CatRentalRequest.find_by(id: params[:id])
    @cat_request.deny!
    redirect_to cat_rental_requests_url
  end

  def new
    @cat_request = CatRentalRequest.new
    render :new
  end

  def create
    # render json: "ok"
    @cat_request = CatRentalRequest.new(cat_rental_request_params)
    # fail
    if @cat_request.save
      render json: "ok"
    else
      render json: "not ok"
    end
  end

  private
  def cat_rental_request_params
    params.require("cat_rental_request").permit(:cat_id, :start_date, :end_date)
  end
end
