module ASDF
  extend self

  def latest(name : String)
    execute(["latest", name])
  end
end
