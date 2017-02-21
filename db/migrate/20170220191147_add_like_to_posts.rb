class AddLikeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :like, :integer
  end
end
