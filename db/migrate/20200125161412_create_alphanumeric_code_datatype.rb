# frozen_string_literal: true

class CreateAlphanumericCodeDatatype < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE alphanumeric_code AS
        ENUM ('alpha', 'beta', 'gamma', 'delta', 'theta', 'lambda', 'tau', 'psi', 'omega');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE alphanumeric_code;
    SQL
  end
end
