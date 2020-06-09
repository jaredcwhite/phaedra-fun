require "phaedra"
require "mongo"
require_relative "../lib/db"

class PhaedraFunction < Phaedra::Base
  def get(params)
    client = SharedDb.client
    record = client[:myCollection].find.first

    output = if ENV["PHAEDRA_ENV"] == "staging"
      "<p>You're on staging! #{record[:lets][:go]}</p>"
    else
      "<p>This is Quite Interesting. 😁</p>\n<p>#{record[:lets][:go]}!</p>\n"
    end
    response["Content-Type"] = "text/html; charset=utf-8"
    output
  end
end
