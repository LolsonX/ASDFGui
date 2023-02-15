module ASDF
  extend self

  def info(&parser : String -> String)
    execute(["info"], &parser)
  end

  def info : String
    execute(["info"])
  end
end
