module ASDF
  extend self

  def shim_versions(command : String)
    execute(["shim-versions", command])
  end
end
