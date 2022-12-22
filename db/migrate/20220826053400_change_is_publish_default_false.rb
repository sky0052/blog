class ChangeIsPublishDefaultFalse < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :is_publish, :boolean, default: false
  end
end
