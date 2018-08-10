class Repository < ApplicationRecord
  belongs_to :owner, dependent: :destroy
end
