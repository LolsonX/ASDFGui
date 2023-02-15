module ASDF
  extend self

  def uninstall(name : String)
    execute(["uninstall", name])
  end

  def uninstall(name : String, version : String)
    execute(["uninstall", name, version])
  end
end
