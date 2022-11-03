class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: nil, comment: 'Name'
      t.integer :age, null: false, default: nil, comment: 'Age'

      t.timestamps
    end
  end
end
