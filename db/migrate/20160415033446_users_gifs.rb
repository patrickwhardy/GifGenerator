class UsersGifs < ActiveRecord::Migration
  def change
    create_join_table :users, :gifs do |t|
    t.index :user_id
    t.index :gif_id
    end
  end
end
