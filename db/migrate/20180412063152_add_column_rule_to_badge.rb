class AddColumnRuleToBadge < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :rule, :string
  end
end
