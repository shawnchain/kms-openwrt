m = Map("kmsd")
m.title = translate("KMS Server")
m.description = translate("A KMS Server Emulator to active your Windows or Office")

m:section(SimpleSection).template  = "kmsd/kmsd_status"

s = m:section(TypedSection, "kmsd")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enabled", translate("Enable"))
enable.rmempty = false

autoactivate = s:option(Flag, "autoactivate", translate("Auto activate"))
autoactivate.rmempty = false

return m
