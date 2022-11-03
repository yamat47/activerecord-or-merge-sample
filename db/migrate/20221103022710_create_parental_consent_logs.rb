class CreateParentalConsentLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :parental_consent_logs do |t|
      t.references :user, null: false, foreign_key: true, comment: 'User ID'
      t.datetime :consented_at, null: false, default: nil, comment: 'Consented Datetime'

      t.timestamps
    end
  end
end
