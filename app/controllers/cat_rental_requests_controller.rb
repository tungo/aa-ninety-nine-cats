class CatRentalRequestsController < ApplicationController

  def new

  end

  def create
    @rental = CatRentalRequest.new(rental_params)
    @rental.status = 'PENDING'
    if @rental.save
      redirect_to cat_url(@rental.cat_id)
    else
      render :new
    end
  end

  def approve
    @rental = CatRentalRequest.find(params[:id])
    @rental.approve!
    redirect_to cat_url(@rental.cat_id)
  end

  def deny
    @rental = CatRentalRequest.find(params[:id])
    @rental.deny!
    redirect_to cat_url(@rental.cat_id)
  end

  private

  def rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date)
  end
end
