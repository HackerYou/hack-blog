class Like < ActiveRecord::Base
  belongs_to :post

  validates :name, uniqueness: true
end
