class CreatePostsTable < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string    :title
      t.text      :body
    end 
  end

  def down
    drop_table :posts
  end
end
