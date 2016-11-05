class RenameAccomodateColumnToCars < ActiveRecord::Migration
  def change
  	rename_column :cars, :accomodate, :accommodate
  end
end
