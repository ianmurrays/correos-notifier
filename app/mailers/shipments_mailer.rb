#encoding: utf-8
class ShipmentsMailer < ActionMailer::Base
  default from: "no-responder@correos.linkworks.cl"

  def validate_email(shipment_id, email)
    @shipment = Shipment.find shipment_id

    mail :subject => "Confirma tu dirección para que te podamos notificar de tu envío",
         :to => email
  end

  def notify(shipment_id)
    @shipment = Shipment.find shipment_id

    mail :subject => "Parece que tu envío #{@shipment.description} (#{@shipment.tracking_code}) llegó a Chile!",
         :to => @shipment.email
  end
end
