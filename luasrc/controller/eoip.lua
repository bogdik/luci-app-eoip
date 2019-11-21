-- Copyright 2008 Yanira <forum-2008@email.de>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.eoip", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/eoip") then
		return
	end

	local page

	page = entry({"admin", "services", "eoip"}, cbi("eoip"), _("EoIP-Tunnel Mikrotik compare"), 60)
	page.dependent = true
end
