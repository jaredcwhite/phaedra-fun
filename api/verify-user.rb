require "phaedra"
require_relative "../lib/db"

class PhaedraFunction < Phaedra::Base
  def get(params)
    user = User.find_login(params[:email].downcase, params[:password])
    user_hash = user&.attributes
    user_hash.delete("password") if user_hash

    {
      user: user_hash,
      verified: user.present?
    }
  end
end
