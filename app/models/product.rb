class Product < ApplicationRecord
  # checks that the fields are not empty!
  validates :title, :description , :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
  with: %r{\.(gif|jpg|png)\Z}i,
  message: 'must be a URL for GIF, JPG or PNG image.'
  }

  def self.latest
    order(:updated_at).latest
  end
end
