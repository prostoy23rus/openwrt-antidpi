module("luci.controller.antidpi", package.seeall)

function index()
    entry({"admin", "services", "antidpi"}, cbi("antidpi"), _("AntiDPI"), 60)

    entry({"admin", "services", "antidpi", "start"}, call("action_start"))
    entry({"admin", "services", "antidpi", "stop"}, call("action_stop"))
    entry({"admin", "services", "antidpi", "update"}, call("action_update"))
    entry({"admin", "services", "antidpi", "auto"}, call("action_auto"))
end

function action_start()
    os.execute("/usr/bin/antidpi start")
end

function action_stop()
    os.execute("/usr/bin/antidpi stop")
end

function action_update()
    os.execute("/usr/bin/antidpi update")
end

function action_auto()
    os.execute("/usr/bin/antidpi auto")
end