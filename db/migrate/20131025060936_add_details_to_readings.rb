class AddDetailsToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :pincode, :string
    add_column :readings, :address, :string
    add_column :readings, :city, :string
  end
end
