class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :type
      t.boolean :isRevoked

      t.timestamps
    end
  end
end