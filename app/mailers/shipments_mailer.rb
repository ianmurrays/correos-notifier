#encoding: utf-8
class ShipmentsMailer < ActionMailer::Base
  default from: "correoschile@correos.linkworks.cl"

  def validate_email(shipment_id, email)
    @shipment = Shipment.find shipment_id

    mail :subject => "Confirma tu dirección para que te podamos notificar de tu envío",
         :to => email
  end
end
