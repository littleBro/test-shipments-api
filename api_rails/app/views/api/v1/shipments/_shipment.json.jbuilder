json.(shipment,
    :id,
    :name
)

json.products shipment.shipment_products do |sp|
  json.(sp.product,
      :id,
      :sku,
      :description,
      :active_shipment_count
  )
  json.quantity sp.quantity
end
