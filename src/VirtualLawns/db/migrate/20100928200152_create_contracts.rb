class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :customer_id
      t.integer :sales_rep_id
      t.integer :service_type_id
      t.float   :price

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
