class Company < ApplicationRecord
  has_many :shipments, dependent: :destroy
  has_many :products, dependent: :destroy

end
