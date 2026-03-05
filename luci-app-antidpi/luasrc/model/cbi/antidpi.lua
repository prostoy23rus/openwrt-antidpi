m = Map("antidpi", "AntiDPI")

s = m:section(TypedSection, "main", "Control")
s.anonymous = true

start = s:option(Button, "_start", "Start AntiDPI")
start.write = function()
    luci.sys.call("/usr/bin/antidpi start")
end

stop = s:option(Button, "_stop", "Stop AntiDPI")
stop.write = function()
    luci.sys.call("/usr/bin/antidpi stop")
end

update = s:option(Button, "_update", "Update Hostlists")
update.write = function()
    luci.sys.call("/usr/bin/antidpi update")
end

auto = s:option(Button, "_auto", "Auto Detect Strategy")
auto.write = function()
    luci.sys.call("/usr/bin/antidpi auto")
end

return m