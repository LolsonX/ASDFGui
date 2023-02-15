module ASDF
  extend self

  def where(name : String)
    execute(["where", name])
  end

  def where(name : String, version : String)
    execute(["where", name, version])
  end
end
