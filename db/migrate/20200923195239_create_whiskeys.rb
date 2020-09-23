class CreateWhiskeys < ActiveRecord::Migration[6.0]
  def change
    create_table :whiskeys do |t|
      t.string :name
      t.string :distiller
      t.string :origin
      t.string :image

      t.timestamps
    end
  end
end
