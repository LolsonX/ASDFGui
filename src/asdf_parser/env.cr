module ASDFParser
	extend self

	def env(text : String) : ParsedType
		text.split("\n", remove_empty: true)
				.map { |var| var.split("=") }
				.reduce({} of String => String) { |acc, (var, val)| acc.merge({var.downcase => val}) }
	end
end
