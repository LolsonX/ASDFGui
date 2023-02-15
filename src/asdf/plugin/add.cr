module ASDF
  module Plugin
    extend self

    def add(name : String, git_url : String?)
      if git_url
        execute(["plugin add", name, git_url])
      else
        execute(["plugin add", name])
      end
    end
  end
end
