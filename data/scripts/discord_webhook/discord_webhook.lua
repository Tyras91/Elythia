-- Sends Discord webhook notifications.
-- The URL layout is https://discord.com/api/webhooks/:id/:token
-- Leave empty if you wish to disable.

announcementChannels = {
	["serverAnnouncements"] = "", -- Used for an announcement channel on your discord
	["raids"] = "https://discord.com/api/webhooks/1145246365321019432/OtQqOEZ8dq0hraQF6RgDsCOcXupc6NcHqY_vWfMcpshzuvB89k5EBoIUYRte1ds-iB9v", -- Used to isolate raids on your discord
	["player-kills"] = "https://discord.com/api/webhooks/1145246021673295892/SF9oD6SgbryIdIGepu8-DemJeL3rzyjw83pgEm885yS1RFHQRpW82yBrtYqiSCWKLtDe", -- Self-explaining
}

--[[
	Example of notification (After you do the config):
	This is going to send a message into your server announcements channel

	local message = blablabla
	local title = test
	Webhook.sendMessage(title, message, WEBHOOK_COLOR_WARNING,
                        announcementChannels["serverAnnouncements"])

	Dev Comment: This lib can be used to add special webhook channels
	where you are going to send your messages. Webhook.specialSend was designed
	to be used with countless possibilities.
]]
