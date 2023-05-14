class BidsController < ApplicationController
  def create
    @loan_request = LoanRequest.find(params[:loan_request_id])
    @bid = @loan_request.bids.create(bid_params)
  end
    
  private
    
  def bid_params
    params.require(:bid).permit(:interest_rate)
  end
end