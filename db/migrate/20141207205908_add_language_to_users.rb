class AddLanguageToUsers < ActiveRecord::Migration
  def change
    execute "delete from room_presences;"
    execute "delete from users;"
    add_column :users, :language, :string, null: false
  end
end
