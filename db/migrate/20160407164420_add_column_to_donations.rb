class AddColumnToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :amount, :interger
    add_column :donations, :status, :string
  end
end
