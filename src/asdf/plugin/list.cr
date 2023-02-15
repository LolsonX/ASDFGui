module ASDF
  module Plugin
    extend self

    def list(urls? = false, refs? = false)
      args = ["plugin", "list"]
      args << "--urls" if urls?
      args << "--refs" if refs?
      execute(args)
    end

    def list_all
      execute(["plugin", "list", "all"])
    end
  end
end
