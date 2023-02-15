module ASDF
  module Plugin
    def update(name : String, git_ref : String?)
      args = ["plugin", "update", name]
      args << git_ref if git_ref
      execute(args)
    end
  end
end
