class ShipmentsController < ApplicationController
  def index
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new params[:shipment].slice(:tracking_code, :email)

    respond_to do |f|
      if @shipment.save
        f.html
      else
        f.html { render :action => :index }
      end
    end
  end
end
