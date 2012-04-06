class Shipment < ActiveRecord::Base
  validates :tracking_code, :email, :description, :presence => true
  validates :valid_email, :inclusion => { :in => [true, false] }
  validates :email, :format => { :with => %r{^[a-zA-Z0-9.!#$\%&'*+-/=?\^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$} }

  before_save :generate_token

private
  
  def generate_token
    self.token = SecureRandom.hex(16)
  end
end
