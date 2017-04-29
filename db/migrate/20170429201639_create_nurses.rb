class CreateNurses < ActiveRecord::Migration[5.1]
  def change
    create_table :nurses do |t|
      t.string :name
      t.string :region
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
