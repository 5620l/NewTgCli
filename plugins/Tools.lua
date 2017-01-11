local function run(msg, matches)
if matches[1] == 'createsuper' and is_sudo(msg) then
   tg.createNewChannelChat(matches[2])
   tg.sendMessage(msg.chat_id_, 0, 1, '<b>SuperGroup '..matches[2]..' Created!</b>', 1, 'html')
elseif matches[1] == 'creategroup' and is_sudo(msg) then
   tg.createNewGroupChat(matches[2])
   tg.sendMessage(msg.chat_id_, 0, 1, '<b>Group '..matches[2]..' Created!</b>', 1, 'html')
elseif matches[1] == 'upgrade' and is_sudo(msg) then
   tg.migrateGroupChatToChannelChat(msg.chat_id_)
elseif matches[1] == 'edit' and is_momod(msg) then
   tg.editMessageText(msg.chat_id_, msg.reply_to_message_id_, nil, string.sub(matches[2], 7), 'html')
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
