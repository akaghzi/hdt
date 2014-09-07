class AddKcalToListItem < ActiveRecord::Migration
  def change
    add_column :list_items, :kcal, :decimal
    add_column :list_items, :fdgrp_cd, :string
  end
end
