class CreateRoomPresences < ActiveRecord::Migration
  def change
    create_table :room_presences, id: :uuid do |t|
      t.uuid :member_id, null: false
      t.uuid :room_id, null: false
      t.timestamps null: false
      t.index [:member_id, :room_id], unique: true
    end
  end
end
