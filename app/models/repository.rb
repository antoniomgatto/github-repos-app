class Repository < ApplicationRecord
  belongs_to :owner, dependent: :destroy

  scope :order_by_more_stars, -> { order(stargazers_count: :desc) }

end
