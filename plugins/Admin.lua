local function run(msg, matches) 
if is_sudo(msg) then 
if matches[1] == 'import' then 
tg.importChatInviteLink('https://telegram.me/joinchat/'..matches[2]) 
elseif matches[1] == 'setbotname' then 
if matches[3] then 
text = "<b>Bot Name Changed To "..matches[2]..matches[3].." </b>" 
bot.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html') 
bot.changeName(matches[2], matches[3]) 
else 
text = "<b>Bot Name Changed To "..matches[2].."</b>"
bot.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html') 
bot.changeName(matches[2], '') 
end 
elseif matches[1] == 'setbotusername' then 
bot.changeUsername(matches[2])
elseif matches[1] == 'rembotusername' then 
bot.changeUsername('') 
elseif matches[1] == 'setbotphoto' then 
bot.sendMessage(msg.chat_id_, 0, 1, '<b>Now Send Photo!</b>', 1, 'html') 
redis:set('botphoto','yes') 
elseif matches[1] == 'photo' and redis:get('botphoto') then 
local file = 'bot/bot.jpg' 
print('File downloaded to:', msg.content_.photo_.sizes_[0].photo_.path_) 
os.rename(msg.content_.photo_.sizes_[0].photo_.path_, file) 
print('File moved to:', file) 
bot.setProfilePhoto(msg.content_.photo_.sizes_[0].photo_.path_) 
redis:del('botphoto',true) 
end 
if matches[1] == 'markread' then 
if matches[2] == 'on' then 
text = '<b> Mark Read => on</b>'
	bot.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html') 
redis:set('markread','on') 
elseif matches[2] == 'off' then 
text = '<b> Mark Read => off</b>'
	bot.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html') 
redis:set('markread','off') 
end 
end 
end 
end 
return {
  patterns = {
    "^[#!/](import) https://telegram.me/joinchat/(.*)$",
	"^[#!/](setbotname) (.*) (.*)$",
	"^[#!/](setbotname) (.*)$",
	"^[#!/](setbotusername) (.*)$",
	"^[#!/](rembotusername)$",
	"^[#!/](setbotphoto)$",
    "^[#!/](markread) (.*)$",
	"^!!!edit:[#!/](markread) (.*)$",
	"^!!!(photo):$",
  },
  run = run
}
