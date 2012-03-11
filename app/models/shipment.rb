class Shipment < ActiveRecord::Base
  validates :tracking_code, :email, :token, :presence => true
  validates :valid_email, :inclusion => { :in => [true, false] }

  before_save :generate_token

private
  
  def generate_token
    self.token = SecureRandom.hex(16)
  end
end
