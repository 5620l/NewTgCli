local function run(msg, matches)
        if matches[1] == 'pin' and is_owner(msg) then
            bot.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 1)
                bot.sendMessage(msg.chat_id_, 0, 0, '<b>Message Has Been Pinned!</b>', 1, 'html')
        elseif matches[1] == 'unpin' and is_owner(msg) then
            bot.unpinChannelMessage(msg.chat_id_)
                bot.sendMessage(msg.chat_id_, 0, 0, '<b>Message Has Been Unpinned!</b>', 1, 'html')
        end end return {
  patterns = {
    "^[#!/](pin)$",
        "^[#!/](unpin)$"
  },
  run = run
}
