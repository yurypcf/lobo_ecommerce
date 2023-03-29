class Product < ApplicationRecord
  paginates_per 10

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :details, resize_to_limit: [600, 700]
  end
end
