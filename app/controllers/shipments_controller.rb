class ShipmentsController < ApplicationController
  def index
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new params[:shipment].slice(:tracking_code, :email)

    respond_to do |f|
      if @shipment.save
        # Send the confirmation email
        ShipmentsMailer.validate_email(@shipment.id, @shipment.email).deliver

        f.html
      else
        f.html { render :action => :index }
      end
    end
  end

  def confirm
    @shipment = Shipment.where(:id => params[:id], :token => params[:token]).first

    respond_to do |f|
      if @shipment
        @shipment.update_attribute :valid_email, true
        @valid_email = true
        f.html
      else
        @valid_email = false
        f.html
      end
    end
  end
end
