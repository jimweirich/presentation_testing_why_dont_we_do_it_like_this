class CreateServiceTypes < ActiveRecord::Migration
  def self.up
    create_table :service_types do |t|
      t.string :description
      t.string :code

      t.timestamps
    end

    add_index :service_types, [:code], :unique => true
  end

  def self.down
    remove_index :service_types, :code
    drop_table :service_types
  end
end
