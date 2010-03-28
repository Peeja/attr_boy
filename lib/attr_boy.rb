module AttrBoy
  def initialize(opts = {})
    opts.each do |attr, value|
      send("#{attr}=", value)
    end
  end
end
