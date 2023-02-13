class CreateAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_choices do |t|
      t.text :text, null: false
      t.references :question, foreign_key: {to_table: :questions}, null: false, index: true

      t.timestamps
    end
  end
end
