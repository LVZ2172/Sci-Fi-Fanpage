class ChangeFormat < ActiveRecord::Migration

  def up
    change_column :reviews, :rating, :float
  end

  def down
    change_column :reviews, :rating, :decimal
  end
end
