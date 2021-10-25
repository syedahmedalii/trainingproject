class AddReceiverIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :receiver_id, :integer
    add_column :messages, :sender_id, :integer
    add_column :messages, :message_body, :text

  end
end
