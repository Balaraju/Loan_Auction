class LoanRequest < ApplicationRecord
  belongs_to :user
  has_many :bids
end
