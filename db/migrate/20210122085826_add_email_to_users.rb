class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string, unique: true
    User.update(1, :email => "sobaka@mail.ru")
    User.update(2, :email => "mail@sobaka.ru")
    change_column_null :users, :email, false
  end
end
