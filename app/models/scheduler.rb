class Scheduler < ApplicationRecord
  scope :exclude, ->(location) { where("location != ?", location) }
  scope :active, -> { where("updated_at >= ?", 5.minutes.ago) }
end
