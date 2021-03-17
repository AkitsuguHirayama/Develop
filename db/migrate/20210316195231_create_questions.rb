class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :description
      t.string :image
      t.text :experience

      t.timestamps
    end
  end
end
