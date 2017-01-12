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
if matches[1] == 'edit' and is_momod(msg) then
   bot.editMessageText(msg.chat_id_, msg.reply_to_message_id_, nil, matches[2] , 'html')
end
return {
   pattern = {
      "^[/#!](createsuper) (.*)$",
      "^[/#!](edit) (.*)$",
      "^[/#!](creategroup) (.*)$",
      "^[/#!](upgrade)$",
   },
   run = run,
}

end
