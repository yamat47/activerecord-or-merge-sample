class User < ApplicationRecord
  belongs_to :guild
  has_many :parental_consent_logs, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :adult_or_parental_consented, lambda {
    merge(
      left_joins(:parental_consent_logs)
        .where(age: 18..)
        .or(ParentalConsentLog.where.not(id: nil))
    )
  }

  scope :merge_unused_adult_or_parental_consented, lambda {
    left_joins(:parental_consent_logs)
      .where(age: 18..)
      .or(ParentalConsentLog.where.not(id: nil))
  }
end
