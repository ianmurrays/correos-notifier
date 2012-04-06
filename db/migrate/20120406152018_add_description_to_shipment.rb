class AddDescriptionToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :description, :string

    # Update current shipments
    Shipment.all.each do |shipment|
      shipment.update_attribute :description, shipment.tracking_code
    end
  end
end
