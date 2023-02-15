module ASDF
  module Plugin
    extend self

    def remove(name : String)
      execute(["plugin", "remove", name])
    end
  end
end
