class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.references :author, foreign_key: {to_table: :users}, null: false, index: true

      t.timestamps
    end
  end
end
