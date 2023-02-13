class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :user, foreign_key: {to_table: :users}, null: false, index: true
      t.references :answer_choice, foreign_key: {to_table: :answer_choices}, null: false, index: true

      t.timestamps
    end
  end
end
