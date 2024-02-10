class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :date_time, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
