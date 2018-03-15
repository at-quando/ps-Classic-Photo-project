class ContractPhotographer < ApplicationRecord
  belongs_to :contract
  belongs_to :photographer
end
