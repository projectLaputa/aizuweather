class AddUserIdToInstruments < ActiveRecord::Migration
  def change
    add_column :instruments, :user_id, :integer
  end
end
