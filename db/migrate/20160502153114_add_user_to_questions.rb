class AddUserToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :creator, references: :user, index: true
    add_foreign_key :questions, :users, column: :creator_id
  end
end
