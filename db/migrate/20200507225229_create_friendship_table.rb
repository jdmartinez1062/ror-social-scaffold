class CreateFriendshipTable < ActiveRecord::Migration[6.0]
  def change
    create_table :friendship, id: false do |t|
      t.bigint :accepter_id
      t.bigint :requester_id
    end
    add_index :friendship, :accepter_id
    add_index :friendship, :requester_id
  end
end
