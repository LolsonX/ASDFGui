require "./asdf/*"

module ASDF
  extend self

  protected def execute(args = %w[]) : String
    Process.new("asdf", args, output: Process::Redirect::Pipe).output.gets_to_end
  end

  protected def execute(args = %w[], &parser : String -> String)
    parser.call(execute(args))
  end
end
