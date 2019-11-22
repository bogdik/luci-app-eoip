-- Copyright 2019 Bogdik
-- Licensed to the public under the Apache License 2.0.

local uci = luci.model.uci.cursor_state()
local net = require "luci.model.network"
local m, s, n, d, v

m = Map("eoip", translate("EoIP - Tunneling"),
        translatef("Can create ethernet tunnels compatible with Mikrotik EoIP tunnel.At current moment it is easiest way to create stateless tunnel with Mikrotik."))

net = net.init(m.uci)

s = m:section(TypedSection, "eoip", translate("Settings"))
s.addremove = true
s.anonymous = true
s:option(Flag, "enabled", translate("Enable tunnel"))


n = s:option(Value, "name", translate("Name interface [zeoip"), translate("If you input 0 interface name zeoip0"))
n.nocreate = true
n.datatype = "min(0), integer"
n.default = 0

n = s:option(Value, "idtun", translate("ID tunnel"), translate("Indeficator id tunnel"))
n.nocreate = true
n.datatype = "min(0), integer"
n.default = 0

d = s:option(Value, "dst", translate("Destination"), translate("Destination IP address for connection EoIP."))
d.nocreate = true
d.datatype = "ipaddr"
d.placeholder = "0.0.0.0"

s:option(Flag, "dynamic", translate("Dynamic"))

v=s:option(DynamicList,"vlan", translate("Vlan"),translate("Vlan TAG on this interface"))
v.datatype = "and(and(max(4094), integer),and(min(1), integer))"


return m
