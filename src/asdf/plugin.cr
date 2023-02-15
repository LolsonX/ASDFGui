require "./plugin/*"

module ASDF
  extend self

  def plugin
    Plugin
  end

  module Plugin
    delegate execute, to: ASDF
  end
end
