module ASDF
  extend self

  def update(experimental? = false)
    if experimental?
      execute(["update", "--head"])
    else
      execute(["update"])
    end
  end
end
