require "open-uri"
require "nokogiri"

namespace :correos do
  task :check => :environment do
    puts "-- Checking shipments"

    Shipment.where(:valid_email => true).each do |shipment|
      doc = Nokogiri::HTML(open("http://courier.correos.cl/seguimientoweb/detalle_envio.aspx?envio=#{shipment.tracking_code}"))
      
      unless doc.css('body').text.match /el envio .+ no existe/
        puts "-- Shipment #{shipment.tracking_code} probably arrived, notifying."
        # It's probably in Chile, let's notify the user.
        ShipmentsMailer.notify(shipment.id).deliver

        # Destroy it, so we don't check it again.
        shipment.destroy
      end
    end
  end
end