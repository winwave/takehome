class NotificationTime < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
