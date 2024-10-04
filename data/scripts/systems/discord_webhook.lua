-- Sends Discord webhook notifications.
-- The URL layout is https://discord.com/api/webhooks/:id/:token
-- Leave empty if you wish to disable.

if not announcementChannels then
	announcementChannels = {
		["serverAnnouncements"] = "", -- Used for an announcement channel on your discord
		["raids"] = "https://discord.com/api/webhooks/1145246365321019432/OtQqOEZ8dq0hraQF6RgDsCOcXupc6NcHqY_vWfMcpshzuvB89k5EBoIUYRte1ds-iB9v", -- Used to isolate raids on your discord
		["player-kills"] = "https://discord.com/api/webhooks/1145246021673295892/SF9oD6SgbryIdIGepu8-DemJeL3rzyjw83pgEm885yS1RFHQRpW82yBrtYqiSCWKLtDe", -- Self-explaining
		["player-levels"] = "", -- Self-explaining
		["reports"] = "https://discord.com/api/webhooks/1279506167055384699/zA6Zqwwx8GzOGxv9scR8VJhcDIR8h2__k8SPyZL79ntZVH9zHba4QVfy-o2MV_RnWw2V",
	}
end

--[[
	Example of notification (After you do the config):
	This is going to send a message into your server announcements channel

	local message = blablabla
	local title = test
	Webhook.sendMessage(title, message, WEBHOOK_COLOR_YELLOW,
                        announcementChannels["serverAnnouncements"])

	Dev Comment: This lib can be used to add special webhook channels
	where you are going to send your messages. Webhook.specialSend was designed
	to be used with countless possibilities.
]]
