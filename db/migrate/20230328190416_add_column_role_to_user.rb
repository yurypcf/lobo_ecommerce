class AddColumnRoleToUser < ActiveRecord::Migration[7.0]
  def change
    create_enum :role_user, ['admin', 'customer', 'stockist']

    change_table :users do |t|
      t.enum :role, enum_type: 'role_user', default: 'customer', null: false
    end
  end
end
