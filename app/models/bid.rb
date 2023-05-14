class Bid < ApplicationRecord
  belongs_to :bank
  belongs_to :loan_request
end
