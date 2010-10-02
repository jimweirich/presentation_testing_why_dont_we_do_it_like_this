class CreateServiceTechs < ActiveRecord::Migration
  def self.up
    create_table :service_techs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :employee_number

      t.timestamps
    end
  end

  def self.down
    drop_table :service_techs
  end
end
