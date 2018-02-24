class Photographer < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
