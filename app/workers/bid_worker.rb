class BidWorker
  include Sidekiq::Worker
  
  def perform(loan_request_id)
    sleep(600) # 10 minutes
    loan_request = LoanRequest.find(loan_request_id)
    best_bid = loan_request.bids.order(interest_rate: :asc).first
    loan_request.update(best_bid: best_bid, status: 'pending')
  end
end