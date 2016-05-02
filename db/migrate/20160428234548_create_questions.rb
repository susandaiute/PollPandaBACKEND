class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :answer1, null: false
      t.string :answer2, null: false
      t.string :answer3, null: false

      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
