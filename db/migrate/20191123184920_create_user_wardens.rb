class CreateUserWardens < ActiveRecord::Migration[6.0]
  def change
    create_table :user_wardens do |t|
      t.integer :user_id
      t.integer :warden_id

      t.index :user_id
      t.index :warden_id

      t.index %i(user_id warden_id), unique: true

      t.timestamps
    end
  end
end
