module ASDF
  extend self

  def help
    execute(["help"])
  end

  def help(plugin : String)
    execute(["help", plugin])
  end

  def help(plugin : String, version : String)
    execute(["help", plugin, version])
  end
end
