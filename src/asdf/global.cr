module ASDF
  extend self

  def global(name : String, version = "latest")
    execute(["global", name, version])
  end
end
