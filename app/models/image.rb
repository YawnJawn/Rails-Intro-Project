class Image < ApplicationRecord
  belongs_to :poke
  has_one_attached :image

  def resize_image
    return unless image.attached?
    image.variant(resize_to_fill: [50, 50]).processed
  end
end
