module ASDF
  extend self

  def which(name : String)
    execute(["which", name])
  end
end
