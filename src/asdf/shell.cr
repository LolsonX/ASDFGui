module ASDF
  extend self

  def shell(name : String, version : String)
    execute(["shell", name, version])
  end
end
