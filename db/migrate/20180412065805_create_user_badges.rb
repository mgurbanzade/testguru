class CreateUserBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :user_badges do |t|
      t.integer :user_id
      t.integer :badge_id
      t.references :user, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
