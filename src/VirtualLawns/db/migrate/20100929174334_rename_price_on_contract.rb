class RenamePriceOnContract < ActiveRecord::Migration
  def self.up
    rename_column :contracts, :price, :price_per_visit
  end

  def self.down
    rename_column :contracts, :price_per_visit, :price
  end
end
