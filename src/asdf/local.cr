module ASDF
  extend self

  def local(name : String, version = "latest")
    execute(["local", name, version])
  end
end
