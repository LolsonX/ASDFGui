module ASDF
  extend self

  def install(name : String, version = "latest")
    execute(["install", name, version])
  end
end
