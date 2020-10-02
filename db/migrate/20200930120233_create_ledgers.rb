class CreateLedgers < ActiveRecord::Migration[6.0]
  def change
    create_table :ledgers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :whiskey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
