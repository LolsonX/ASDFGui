module ASDFParser
	extend self

	def current(text : String) : ParsedType
		text.split("\n", remove_empty: true)
				.map { |pdata| pdata.split(3) }
				.reduce({} of String => Hash(String, String)) do |acc, (name, version, file)|
					acc.merge!({ name => { "version" => version, "file" => file}})
			end
		end
end

