class CreateNotificationTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_times do |t|
      t.datetime :scheduled
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
