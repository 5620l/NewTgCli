local function run(msg, matches)
if matches[1] == 'createsuper' and is_sudo(msg) then
   bot.createNewChannelChat(matches[2], 1)
   bot.sendMessage(msg.chat_id_, 0, 1, '<b>SuperGroup '..matches[2]..' Created!</b>', 1, 'html')
end
if matches[1] == 'creategroup' and is_sudo(msg) then
   bot.createNewGroupChat(matches[2], 1)
   bot.sendMessage(msg.chat_id_, 0, 1, '<b>Group '..matches[2]..' Created!</b>', 1, 'html')
end
if matches[1] == 'upgrade' and is_sudo(msg) then
   bot.migrateGroupChatToChannelChat(msg.chat_id_)
end
if matches[1] == 'edit' and is_momod(msg) and msg.reply_to_message_id_ ~= 0 then
   bot.editMessageText(msg.chat_id_, 0, 0, nil, matches[2] , 1, 'html')
end
if matches[1] == 'id' then
local function dl_photo(arg,data)
   bot.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'<b>Supergroup ID : '..msg.chat_id_.."\nYour ID : "..msg.sender_user_id_.."\nChannel =></b> @SignalChannel", 1, 'html')
end
if matches[1] == 'invite' and is_sudo(msg) then
   bot.addChatMember(msg.chat_id_, matches[2] , 20)
end
if matches[1] == 'delete' and is_momod(msg) and msg.reply_to_message_id_ ~= 0 then
   bot.deleteMessages(msg.chat_id_, {[0] = msg.reply_to_message_id_})
end
return {
   pattern = {
      "^[/#!](createsuper) (.*)$",
      "^[/#!](edit) (.*)$",
      "^[/#!](creategroup) (.*)$",
      "^[/#!](upgrade)$",
      "^[/#!](id)$",
      "^[/#!](invite) (.*)$",
      "^[/#!](delete)$",
   },
   run = run,
}

end
