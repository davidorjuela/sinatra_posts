class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
        t.string :description
        t.datetime :created_at
        t.datetime :updated_at
    end
  end
end
