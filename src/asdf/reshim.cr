module ASDF
  extend self

  def reshim
    execute(["reshim"])
  end

  def reshim(name : String)
    execute(["reshim", name])
  end

  def reshim(name : String, version : String)
    execute(["reshim", name, version])
  end
end
