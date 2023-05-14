class User < ApplicationRecord
  has_many :loan_requests
end
