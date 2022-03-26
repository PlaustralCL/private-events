class AddRecoverableToDevise < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
