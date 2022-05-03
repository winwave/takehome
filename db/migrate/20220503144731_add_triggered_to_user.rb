class AddTriggeredToUser < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :triggered, :boolean, default: false )
  end
end
