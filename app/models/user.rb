class User < ApplicationRecord
  has_many :parental_consent_logs, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
