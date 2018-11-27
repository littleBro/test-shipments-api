class Product < ApplicationRecord
  belongs_to :company
  has_many :shipment_products
  has_many :shipments, through: :shipment_products

  def self.associations_to_prefetch
    :shipments
  end

  def active_shipment_count
    shipments.length
  end
end
