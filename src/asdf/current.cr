module ASDF
  extend self

  def current : String
    execute(["current"])
  end

  def current(name : String)
    execute(["current", name])
  end
end
