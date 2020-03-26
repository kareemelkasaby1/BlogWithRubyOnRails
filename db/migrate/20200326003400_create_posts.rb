class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 50, presence: true, allow_nil: true
      t.string :content, null: false, presence: true, allow_nil: true
      t.timestamp :created_at
      t.timestamp :update_at
    end
  end
end
