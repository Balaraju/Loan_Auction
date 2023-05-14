class BidsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bids_#{params[:loan_request_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
