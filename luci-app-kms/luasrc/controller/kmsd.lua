module("luci.controller.kmsd", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/kmsd") then
		return
	end

	entry({"admin", "services", "kmsd"}, alias("admin", "services", "kmsd", "basic"), _("KMS Server"), 100).dependent = true
	entry({"admin", "services", "kmsd", "basic"}, cbi("kmsd/basic"), _("Basic Setting"), 1).leaf = true
	entry({"admin", "services", "kmsd", "config"}, cbi("kmsd/config"), _("Config File"), 2).leaf = true
	entry({"admin", "services", "kmsd", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e = {}
	e.running = luci.sys.call("pgrep kmsd >/dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end
