require "./asdf_parser/*"

module ASDFParser
	extend self

	alias ParsedType = Hash(Symbol, String) |
										 Hash(Symbol, Int64) |
										 Hash(Symbol, UInt64) |
										 Hash(Symbol, Float64) |
										 Hash(Symbol, Array(String)) |
										 Hash(Symbol, Array(Int64)) |
										 Hash(Symbol, Array(Float64)) |
										 Hash(Symbol, Array(UInt64))

	alias ParserMethod = Proc(String, Hash(Symbol, Int64)) |
											 Proc(String, Hash(Symbol, UInt64)) |
											 Proc(String, Hash(Symbol, Float64)) |
											 Proc(String, Hash(Symbol, String)) |
											 Proc(String, Hash(Symbol, Array(Int64))) |
											 Proc(String, Hash(Symbol, Array(UInt64))) |
											 Proc(String, Hash(Symbol, Array(Float64))) |
											 Proc(String, Hash(Symbol, Array(String)))

	alias ParserContainer = Hash(Symbol, ParserMethod)

	@@parsers = ParserContainer.new

	def parse(parser_name : Symbol, text : String) : ParsedType
		unless(parsers.has_key?(parser_name))
			raise ArgumentError.new("Parser #{parser_name} is not registered")
		end

		parsers[parser_name].call(text)
	end

	def register_parser(name : Symbol, parser : ParserMethod)
		if(parsers.has_key?(name))
			raise ArgumentError.new("Key #{name} already_exists")
		end

		parsers[name] = parser
	end

	def parsers : ParserContainer
		@@parsers
	end
end

ASDFParser.register_parser(:info, ->ASDFParser.info(String))
