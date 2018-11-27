class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_products
  has_many :products, through: :shipment_products

  scope :with_products, -> { includes(products: Product.associations_to_prefetch) }

  scope :by_company, -> id { where(company_id: id) }
  scope :by_transport, -> transport { where(international_transportation_mode: transport) }
  scope :sorted_by, -> sort { order(sort) }
  scope :sort_direction, -> (value = 'asc') { reverse_order if value == 'desc' }
end
