module ASDF
  extend self

  def env(command : String)
    execute(["env", command])
  end

  def env(command : String, util : String)
    execute(["env", command, util])
  end
end
