local function run(msg, matches)
if matches[1] == 'addadmin' and is_sudo(msg) and msg.reply_to_message_id_ then
  function addadmin_by_reply(extra, result, success)
  local hash = 'bot:admins:'
  if database:sismember(hash, result.sender_user_id_) then
  bot.sendMessage(msg.chat_id_, msg.id_, 1, '<i>User '..result.sender_user_id_..' Is Already Admin!</i>', 1, 'html')
  else
  redis:sadd(hash, result.sender_user_id_)
  bot.sendMessage(msg.chat_id_, msg.id_, 1, '<i>User '..result.sender_user_id_..' Added To Signal Admins!</i>', 1, 'html')
  end
  end
  bot.getMessage(msg.chat_id_, msg.reply_to_message_id_,addadmin_by_reply)
  end
if matches[1] == 'remadmin' and is_sudo(msg) and msg.reply_to_message_id_ then
function deadmin_by_reply(extra, result, success)
local hash = 'bot:admins:'
if not redis:sismember(hash, result.sender_user_id_) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '<i>User '..result.sender_user_id_..' Is Not Admin!</i>', 1, 'html')
else
redis:srem(hash, result.sender_user_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '<i>User '..result.sender_user_id_..' Removed From Signal Admins!</i>', 1, 'html')
end
end
bot.getMessage(msg.chat_id_, msg.reply_to_message_id_,deadmin_by_reply)
end
if matches[1] == 'adminlist' and is_sudo(msg) then
local hash =  'bot:admins:'
local list = redis:smembers(hash)
local text = "Signal Admins:\n\n"
for k,v in pairs(list) do
local user_info = redis:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text..k.." - @"..username.." ["..v.."]\n"
else
text = text..k.." - "..v.."\n"
end
end
if #list == 0 then
text = "<i>Bot Admins List Is Empty!</i>"
end
bot.sendMessage(msg.chat_id_, msg.id_, 1, '`'..text..'`', 'html')
end
if matches[1] == 'id' and msg.reply_to_message_id_ then
function id_by_reply(extra, result, success)
local user_msgs = redis:get('user:msgs'..result.chat_id_..':'..result.sender_user_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1, "<b>User ID : "..result.sender_user_id_.."\nNumber Of Messages : "..user_msgs.."</b>", 1, 'html')
end
bot.getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
end
if matches[1] == 'invite' and msg.reply_to_message_id_ and is_sudo(msg) then
function inv_reply(extra, result, success)
bot.addChatMember(result.chat_id_, result.sender_user_id_, 5)
end
bot.getMessage(msg.chat_id_, msg.reply_to_message_id_,inv_reply)
end
if matches[1] == 'id' and msg.reply_to_message_id_ == 0  then
local function getpro(extra, result, success)
local user_msgs = redis:get('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if result.photos_[0] then
bot.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,'<b>Supergroup ID : '..msg.chat_id_..'\nYour ID : '..msg.sender_user_id_..'\nNumber Of Your Messages : '..user_msgs..'</b>',msg.id_,msg.id_, 1, 'html')
else      
bot.sendMessage(msg.chat_id_, msg.id_, 1, "<b>You Have'nt Profile Photo!!</b>\n\n<i>Supergroup ID : "..msg.chat_id_.."\nYour ID : "..msg.sender_user_id_.."\nNumber Of Your Messages : "..user_msgs.."</i>", 1, 'html')
end
end
tdcli_function ({
        ID = "GetUserProfilePhotos",
        user_id_ = msg.sender_user_id_,
        offset_ = 0,
        limit_ = 1
      }, getpro, nil)
end
if matches[1] == 'delete' and is_momod(msg) then
    local delnumb = {string.match(matches[2])}
    if tonumber(delnumb[2]) > 100 then
      bot.sendMessage(msg.chat_id_, msg.id_, 1, '<b>Error!</b>\n<i>Use /delete [1-100]</i>', 1, 'html')
    else
      local id = msg.id_ - 1
      for i= id - delnumb[2] , id do
        bot.deleteMessages(msg.chat_id_,{[0] = i})
      end
      bot.sendMessage(msg.chat_id_, msg.id_, 1, '<i>'..delnumb[2]..' Last Messages Has Been Removed!</i>', 1, 'html')
    end	
  end
end
return {
  pattern = {
    "^[/#!](addadmin)$",
    "^[/#!](remadmin)$",
    "^[/#!](adminlist)$",
    "^[/#!](id)$",
    "^[/#!](invite)$",
    "^[/#!](delete) (.*)$",
    },
  run = run,
}
