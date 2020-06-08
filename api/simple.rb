require "phaedra"
require "mongo"
require_relative "../lib/db"

class PhaedraFunction < Phaedra::Base
  def get(params)
    client = SharedDb.client
    record = client[:myCollection].find.first

    response["Content-Type"] = "text/html; charset=utf-8"
    "<p>This is Interesting. 😁</p>\n<p>#{record[:lets][:go]}!</p>\n"
  end
end
