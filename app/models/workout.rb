class Workout < ApplicationRecord
  belongs_to :users
  has_many :excersizes, dependent: :destroy

  accepts_nested_attributes_for :excersizes, allow_destroy: true
end
