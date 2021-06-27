class ProductSerializer < ActiveModel::Serializer
  attributes :id, :tax, :is_discounted, :total, :name, :description, :price, :supplier, :image
end
