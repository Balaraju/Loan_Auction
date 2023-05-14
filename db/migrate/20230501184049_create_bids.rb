class CreateBids < ActiveRecord::Migration[7.0]
  def change
    create_table :bids do |t|
      t.float :interest_rate
      t.references :bank, null: false, foreign_key: true
      t.references :loan_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
