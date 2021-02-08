class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.references :user, foreign_key: true, null: false
      t.string :subject, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
