class Api::V1::ShipmentsController < ApplicationController
  has_scope :by_company, as: :company_id
  has_scope :by_transport, as: :international_transportation_mode
  has_scope :sorted_by, as: :sort, default: :id
  has_scope :sort_direction, as: :direction
  has_scope :page, default: 0
  has_scope :per, default: 4

  def index
    unless params[:company_id].present?
      raise StandardError.new('company_id is required')
    end

    @shipments = apply_scopes(Shipment).with_products
  end
end
