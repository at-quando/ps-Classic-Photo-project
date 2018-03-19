class Contract < ApplicationRecord
  has_many :contract_plans
  has_many :viewers
  accepts_nested_attributes_for :contract_plans, :allow_destroy => true
  accepts_nested_attributes_for :viewers, :allow_destroy => true
  belongs_to :price, optional: true
  mount_uploader :sign, SignUploader
end
