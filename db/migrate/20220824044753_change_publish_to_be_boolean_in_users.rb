class ChangePublishToBeBooleanInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :is_publish, :boolean
  end
end
