class LoanRequestsController < ApplicationController
  def new
    @loan_request = LoanRequest.new
  end
  
  def create
    @loan_request = LoanRequest.create(loan_request_params)
    BidWorker.perform_async(@loan_request.id)
    redirect_to @loan_request
  end
  
  def show
    @loan_request = LoanRequest.find(params[:id])
    @best_bid = @loan_request.bids.order(interest_rate: :asc).first
  end
  
  def accept_bid
    @loan_request = LoanRequest.find(params[:id])
    @loan_request.update(status: 'accepted')
  end
  
  def reject_bid
    @loan_request = LoanRequest.find(params[:id])
    @loan_request.update(status: 'rejected')
  end
    
  private
    
  def loan_request_params
    params.require(:loan_request).permit(:amount, :quality_of_business)
  end
end
  