class CreateLoanRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_requests do |t|
      t.integer :amount
      t.string :quality
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
