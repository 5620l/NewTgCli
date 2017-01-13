function vardump(value, depth, key)
  local linePrefix = ''
  local spaces = ''
  if key ~= nil then
    linePrefix = key .. ' = '
  end
  if depth == nil then
    depth = 0
  else
    depth = depth + 1
    for i=1, depth do
      spaces = spaces .. '  '
    end
  end
  if type(value) == 'table' then
    mTable = getmetatable(value)
    if mTable == nil then
      print(spaces .. linePrefix .. '(table) ')
    else
      print(spaces .. '(metatable) ')
      value = mTable
    end
    for tableKey, tableValue in pairs(value) do
      vardump(tableValue, depth, tableKey)
    end
  elseif type(value)  == 'function' or type(value) == 'thread' or type(value) == 'userdata' or value == nil then
    print(spaces .. tostring(value))
  elseif type(value)  == 'string' then
    print(spaces .. linePrefix .. '"' .. tostring(value) .. '",')
  else
    print(spaces .. linePrefix .. tostring(value) .. ',')
  end
end

function dl_cb(arg, data)
end

function kick_reply(extra, result, success)
  b = vardump(result)
  bot.changeChatMemberStatus(result.chat_id_, result.sender_user_id_, 'Kicked')
  bot.sendMessage(result.chat_id_, 0, 0, 1, nil, '<b>User '..result.sender_user_id_..' Kicked!</b>', 1, 'html')
end

function ban_reply(extra, result, success)
  b = vardump(result)
  bot.changeChatMemberStatus(result.chat_id_, result.sender_user_id_, 'Banned')
  bot.sendMessage(result.chat_id_, 0, 0, 1, nil, '<b>User '..result.sender_user_id_..' Banned!</b>', 1, 'html')
end

local function run(msg, matches)
  if matches[1] == 'kick' and is_momod(msg) then
    if not matches[2] then
      bot.getMessage(msg.chat_id_, msg.reply_to_message_id_, kick_reply, nil)
    else
      bot.changeChatMemberStatus(msg.chat_id_, matches[2] , 'Kicked') 
      bot.sendMessage(msg.chat_id_, 0, 0, 1, nil, '<b>User '..matches[2]..' Kicked!</b>', 1, 'html')
    end
  end
  if matches[1] == 'ban' and is_momod(msg) then
    if not matches[2] then
      bot.getMessage(msg.chat_id_, msg.reply_to_message_id_, ban_reply, nil)
    else
      bot.changeChatMemberStatus(msg.chat_id_, matches[2] , 'Banned') 
      bot.sendMessage(msg.chat_id_, 0, 0, 1, nil, '<b>User '..matches[2]..' Banned!</b>', 1, 'html')
    end
  end
  if matches[1] == 'id' then
    bot.sendMessage(msg.chat_id_, msg.id_, 0, 1, nil, '<b>SuperGroup ID : '..msg.chat_id_..'\n\nYour ID : '..msg.sender_user_id_..'</b>', 1, 'html')
  end
  if matches[1] == 'setname' and is_owner(msg) then
    bot.changeChatTitle(msg.chat_id_, matches[2] , 1)
  end
  if matches[1] == 'invite' and is_sudo(msg) then
    bot.addChatMember(msg.chat_id_, matches[2] , 20)
  end
end
return {
  pattern = {
    "^[/#!](kick)$",
    "^[/#!](kick) (.*)$",
    "^[/#!](ban)$",
    "^[/#!](ban) (.*)$",
    "^[/#!](id)$",
    "^[/#!](setname) (.*)$",
    "^[/#!](invite) (.*)$",
    },
  run = run,
}
