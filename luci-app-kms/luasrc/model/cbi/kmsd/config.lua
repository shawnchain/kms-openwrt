m = Map("kmsd")

s = m:section(TypedSection, "kmsd")
s.addremove = false
s.anonymous = true

config = s:option(TextValue, "config")
config.description = translate("This file is /etc/kms/kmsd.ini.")
config.template = "cbi/tvalue"
config.rows = 25
config.wrap = "off"

function config.cfgvalue(self, section)
	return nixio.fs.readfile("/etc/kms/kmsd.ini")
end

function config.write(self, section, value)
	value = value:gsub("\r\n?", "\n")
	nixio.fs.writefile("/etc/kms/kmsd.ini", value)
end

return m
