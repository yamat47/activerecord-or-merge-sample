class ParentalConsentLog < ApplicationRecord
  belongs_to :user

  validates :consented_at, presence: true
end
