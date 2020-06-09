class OutputEnv < SiteBuilder
  def build
    liquid_tag "output_env" do
      phaedra_env = ENV["PHAEDRA_ENV"] || "unknown"
      "ENV is: #{phaedra_env}"
    end
  end
end