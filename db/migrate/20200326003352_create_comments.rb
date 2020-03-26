class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment, null: false, presence: true, allow_nil: true
      t.timestamp :created_at
      t.timestamp :update_at
    end
  end
end
