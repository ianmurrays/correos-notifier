class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :tracking_code
      t.string :email
      t.boolean :valid_email, :default => false
      t.string :token

      t.timestamps
    end
  end
end
