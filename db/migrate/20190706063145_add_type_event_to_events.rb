class AddTypeEventToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :type_event, :string
  end
end
