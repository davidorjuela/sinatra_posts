class CreateCommentsTable < ActiveRecord::Migration[5.2]
  def change
        create_table :comments do |t|
            t.string :description
            t.datetime :created_at
            t.datetime :updated_at
        end
  end
end
