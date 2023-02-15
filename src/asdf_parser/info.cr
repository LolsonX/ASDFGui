module ASDFParser
	extend self

	INFO_DATA_MAP = {
		os: 0,
		shell: 1,
		asdf_version: 2,
		asdf_env: 3,
		installed_plugins: 4,
	}

	def info(text : String) : ParsedType
		segments = text.split("\n\n")
		grouped = segments.map do |segment|
			segment.split("\n")
		end
		res = {} of String => InfoValue 		
		res.merge!({ "asdf_version" => grouped[INFO_DATA_MAP[:asdf_version]][1] })
		res.merge!(os_info(grouped[INFO_DATA_MAP[:os]]))
		res.merge!(shell_info(grouped[INFO_DATA_MAP[:shell]]))
		res.merge!(asdf_env(grouped[INFO_DATA_MAP[:asdf_env]]))
		res.merge!(installed_plugins(grouped[INFO_DATA_MAP[:installed_plugins]][1..]))
		res
	end

	private def os_info(os_data) : Hash(String, String)
		# TODO create more reliable parsing since cpu arch
		# and hardware_arch are skipped if unknowned also
		# need to check kernel_version field
		data = os_data[1].split(" ")
		{
			"kernel_name" => data[0],
			"node_name" => data[1],
			"kernel_release" => data[2],
			"kernel_version" => data[3..7].join(" "),
			"machine_arch" => data[8],
			"cpu_arch" => data[9],
			"hardware_arch" => data[10],
			"system" => data[11]
		}
	end

	private def shell_info(shell_data)
		data = shell_data[1].split(", ")
		{ 
			"shell_name" => data[0],
			"shell_version" => data[1].split(" ")[1]
		}
	end

	private def asdf_env(env_data)
		{
			"env" => env_data[1].split("\n")
				.map { |row| row.split("=") }
				.reduce({} of String => String) { |acc, (name, val)| acc.merge({name.downcase => val}) }
		}
	end

	private def installed_plugins(plugins_data)
		{
			"installed_plugins" => plugins_data.map { |row| row.gsub(/\s+/, " ").split(" ") }
				.reduce({} of String => Hash(String, String)) do |acc, (plugin, version, branch, commit)|
					acc.merge({ plugin => { "version" => version,
																  "branch" => branch,
																  "commit" => commit }})
			end
		}
	end
end
