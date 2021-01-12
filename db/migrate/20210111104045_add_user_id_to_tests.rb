class AddUserIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, foreign_key: true
    Test.update_all(user_id: 1)
    change_column_null :tests, :user_id, false
  end
end
