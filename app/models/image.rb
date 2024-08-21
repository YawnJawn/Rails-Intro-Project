class Image < ApplicationRecord
  belongs_to :poke
  has_one_attached :image

  def resize_image
    return unless image.attached?
    image.variant(resize_to_fill: [100, 100]).processed
  end
end
