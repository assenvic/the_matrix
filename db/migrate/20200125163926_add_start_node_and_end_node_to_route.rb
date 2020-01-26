# frozen_string_literal: true

class AddStartNodeAndEndNodeToRoute < ActiveRecord::Migration[5.2]
  def up
    add_column :routes, :start_node, :alphanumeric_code
    add_column :routes, :end_node, :alphanumeric_code
  end

  def down
    remove_column :routes, :start_node
    remove_column :routes, :end_node
  end
end
