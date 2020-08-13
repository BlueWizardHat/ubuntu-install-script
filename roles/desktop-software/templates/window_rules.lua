-- the debug_print command does only print anything to stdout
-- if devilspie2 is run using the --debug option
debug_print("Window Name=" .. get_window_name() .. "; Application name=" .. get_application_name() .. "; Type=" .. get_window_type().. "; Class="..get_window_class() .. ";Role="..get_window_role()..";")

-- Sublime Text
if (get_window_class() == "Sublime_text") then
	debug_print("Pinning Sublime Text window")
	pin_window()
end

-- KeePass2
if (get_window_class() == "KeePass2") then
	debug_print("Pinning KeePass2 window")
	-- set_skip_pager(true)
	pin_window()
end

-- Eclipse
if (get_window_class() == "Eclipse") then
	debug_print("Putting Eclipse on workspace 1")
	set_window_workspace(1)
	change_workspace(1)
end

-- Skype
if (get_window_class() == "Skype") then
	debug_print("Skype window")
	-- set_window_workspace(4)
	-- set_skip_pager(true)
	pin_window()
end

-- HipChat
if (get_window_class() == "HipChat") then
	debug_print("HipChat window")
	-- set_window_workspace(4)
	-- set_skip_pager(true)
	pin_window()
end

-- Slack
if (get_window_class() == "Slack") then
	debug_print("Slack window")
	-- set_window_workspace(4)
	-- set_skip_pager(true)
	pin_window()
end

-- Firefox
if (get_window_class() == "Firefox") then
	debug_print("Firefox window")
	set_window_workspace(2)
	-- center()
	change_workspace(2)
end

-- Chrome
if (get_window_class() == "Chromium-browser") then
	if (get_window_name() == "Google Play Music") then
		debug_print("Pinning Google Play Music")
		pin_window()
		-- set_skip_pager(true)
	else
		debug_print("Chrome window")
		set_window_workspace(2)
		-- center()
		change_workspace(2)
	end
end

-- Thunderbird
-- if (get_window_class() == "Thunderbird") then
-- 	debug_print("Thunderbird window")
-- 	set_window_workspace(4)
-- 	center()
--  change_workspace(4)
-- end

-- Spotify (Initially shows up as "Untitled window")
if ((get_window_class() == "Spotify") or (get_window_name() == "Untitled window" and get_window_class() == "")) then
	debug_print("Spotify window")
	set_window_workspace(6)
	center()
	change_workspace(6)
end

-- Urxvt
-- if (get_window_class() == "URxvt" and get_application_name() == "StickyUrxvt") then
--	debug_print("Urxvt")
--	pin_window()
-- end
