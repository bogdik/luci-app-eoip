-- Copyright 2008 Yanira <forum-2008@email.de>
-- Copyright 2012 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

local uci = luci.model.uci.cursor_state()
local net = require "luci.model.network"
local m, s, n, d

m = Map("eoip", translate("EoIP - Tunneling"),
        translatef("Can create ethernet tunnels compatible with Mikrotik EoIP tunnel.At current moment it is easiest way to create stateless tunnel with Mikrotik."))

net = net.init(m.uci)

s = m:section(TypedSection, "eoip", translate("Settings"))
s.addremove = true
s.anonymous = true
s:option(Flag, "enabled", translate("Enable tunnel"))


n = s:option(Value, "name", translate("Name interface [zeoip"), translate("If you input 0 interface name zeoip0"))
n.nocreate = true
n.datatype = "uinteger"
n.default = 0

n = s:option(Value, "idtun", translate("ID tunnel"), translate("Indeficator id tunnel"))
n.nocreate = true
n.datatype = "uinteger"
n.default = 0

d = s:option(Value, "dst", translate("Destination"), translate("Destination IP address for connection EoIP."))
d.nocreate = true
d.datatype = "ipaddr"
d.placeholder = "0.0.0.0"

s:option(Flag, "dynamic", translate("Dynamic"))

return m
