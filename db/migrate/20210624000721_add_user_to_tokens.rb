class AddUserToTokens < ActiveRecord::Migration[6.1]
  def change
    add_reference :tokens, :user, foreign_key: true
  end
end
