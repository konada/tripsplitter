class AddInvoiceToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :invoice, :string
  end
end
