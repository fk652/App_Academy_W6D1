class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :text, null: false
      t.references :poll, foreign_key: {to_table: :polls}, null: false, index: true

      t.timestamps
    end
  end
end
