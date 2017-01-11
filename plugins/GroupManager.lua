local function group_settings(msg, target, group)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup Settings :</b>'
pm = pm..'\n <i>Lock Links : '..(group[tostring(target)]['settings']['lock_link'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Username : '..(group[tostring(target)]['settings']['lock_username'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Edit : '..(group[tostring(target)]['settings']['lock_edit'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Location : '..(group[tostring(target)]['settings']['lock_location'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Caption : '..(group[tostring(target)]['settings']['lock_caption'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Inline : '..(group[tostring(target)]['settings']['lock_inline'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Reply : '..(group[tostring(target)]['settings']['lock_reply'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Fwd : '..(group[tostring(target)]['settings']['lock_fwd'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Spam : '..(group[tostring(target)]['settings']['lock_spam'] or 'no')..'</i>'
pm = pm..'\n <i>Lock English : '..(group[tostring(target)]['settings']['lock_english'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Persian : '..(group[tostring(target)]['settings']['lock_persian'] or 'no')..'</i>'
pm = pm..'\n <i>Lock TGservice : '..(group[tostring(target)]['settings']['lock_tgservice'] or 'no')..'</i>'
pm = pm..'\n <i>Lock Sticker : '..(group[tostring(target)]['settings']['lock_sticker'] or 'no')..'</i>'
pm = pm..'\n🔧<b>Mutelist :</b>'
pm = pm..'\n <i>Mute All : '..(group[tostring(target)]['settings']['mute_all'] or 'no')..'</i>'
pm = pm..'\n <i>Mute Photo : '..(group[tostring(target)]['settings']['mute_photo'] or 'no')..'</i>'
pm = pm..'\n <i>Mute Video : '..(group[tostring(target)]['settings']['mute_video'] or 'no')..'</i>'
pm = pm..'\n <i>Mute Contact : '..(group[tostring(target)]['settings']['mute_contact'] or 'no')..'</i>'
pm = pm..'\n <i>Mute Voice : '..(group[tostring(target)]['settings']['mute_voice'] or 'no')..'</i>'
pm = pm..'\n <i>Mute Document : '..(group[tostring(target)]['settings']['mute_document'] or 'no')..'</i>'
pm = pm..'\n <i>Mute Audio : '..(group[tostring(target)]['settings']['mute_audio'] or 'no')..'</i>'
pm = pm..'\n <i>Mute Gif : '..(group[tostring(target)]['settings']['mute_gif'] or 'no')..'</i>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end
local function lock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    pm = '<b>Links Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Links Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'yes' then
    pm = '<b>Username Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_username'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Username Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'yes' then
    pm = '<b>Edit Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_edit'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Edit Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'yes' then
    pm = '<b>Forward Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_fwd'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Forward Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_location(msg, target)
local group = load_data('bot/group.json')
  local group_location_lock = group[tostring(target)]['settings']['lock_location']
  if group_location_lock == 'yes' then
    pm = '<b>Location Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_location'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Location Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_caption(msg, target)
local group = load_data('bot/group.json')
  local group_caption_lock = group[tostring(target)]['settings']['lock_caption']
  if group_caption_lock == 'yes' then
    pm = '<b>Caption Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_caption'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Caption Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'yes' then
    pm = '<b>Inline Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_inline'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Inline Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_reply(msg, target)
local group = load_data('bot/group.json')
  local group_reply_lock = group[tostring(target)]['settings']['lock_reply']
  if group_reply_lock == 'yes' then
    pm = '<b>Reply Is Already Locked!</b>'
  bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_reply'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Reply Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end

local function unlock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    pm = '<b>Links Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Links Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_bots(msg, target)
local group = load_data('bot/group.json')
  local group_bots_lock = group[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    pm = '<b>Bots Production Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Bots Production Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_location(msg, target)
local group = load_data('bot/group.json')
  local group_location_lock = group[tostring(target)]['settings']['lock_location']
  if group_location_lock == 'no' then
    pm = '<b>Location Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_location'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Location Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_caption(msg, target)
local group = load_data('bot/group.json')
  local group_caption_lock = group[tostring(target)]['settings']['lock_caption']
  if group_caption_lock == 'no' then
    pm = '<b>Caption Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_caption'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Caption Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'no' then
    pm = '<b>Inline Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_inline'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Inline Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_reply(msg, target)
local group = load_data('bot/group.json')
  local group_reoly_lock = group[tostring(target)]['settings']['lock_reply']
  if group_reply_lock == 'no' then
    pm = '<b>Reply Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_reply'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Reply Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'no' then
    pm = '<b>Username Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_username'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Username Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'no' then
    pm = '<b>Edit Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_edit'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Edit Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'no' then
    pm = '<b>Forward Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_fwd'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Forward Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'yes' then
    pm = '<b>English Is Already Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_english'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>English Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'no' then
    pm = '<b>English Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_english'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>English Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'yes' then
    pm = '<b>Persian Is Already Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_persian'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Persian Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'no' then
    pm = '<b>Persian Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_persian'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Persian Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_tgservice(msg, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'yes' then
    pm = '<b>TGservice Is Already Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_tgservice'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>TGservice Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_tgservice(msg, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'no' then
    pm = '<b>TGservice Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_tgservice'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>TGservice Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
    pm = '<b>Sticker Is Already Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Sticker Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
    pm = '<b>Sticker Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Sticker Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spam_lock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'yes' then
    pm = '<b>Spam Is Already Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Spam Has Been Locked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spam_lock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'no' then
    pm = '<b>Spam Is Already Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Spam Has Been Unlocked!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'yes' then
    pm = '<b>Mute All Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_all'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Mute All Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'no' then
    pm = '<b>Mute All Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_all'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Mute All Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'yes' then
    pm = '<b>Mute Photo Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Mute Photo Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'no' then
    pm = '<b>Mute Photo Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Mute Photo Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'yes' then
    pm = '<b>Mute Video Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_video'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Mute Video Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'no' then
    pm = '<b>Mute Video Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_video'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Mute Video Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'yes' then
    pm = '<b>Mute Gif Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Mute Gif Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'no' then
    pm = '<b>Mute Gif Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Mute Gif Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'yes' then
    pm = '<b>Mute Voice Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Mute Voice Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'no' then
    pm = '<b>Mute Voice Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Mute Voice Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'yes' then
    pm = '<b>Mute Audio Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Mute Audio Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'no' then
    pm = '<b>Mute Audio Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Mute Audio Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'yes' then
    pm = '<b>Mute Document Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_document'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Mute Document Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'no' then
    pm = '<b>Mute Document Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_document'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Mute Document Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_contact_group(msg, target)
local group = load_data('bot/group.json')
  local mute_contact = group[tostring(target)]['settings']['mute_contact']
  if mute_contact == 'yes' then
    pm = '<b>Mute Contact Is Already Enable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_contact'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Mute Contact Has Been Enabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_contact_group(msg, target)
local group = load_data('bot/group.json')
  local mute_contact = group[tostring(target)]['settings']['mute_contact']
  if mute_contact == 'no' then
    pm = '<b>Mute Contact Is Already Disable!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_contact'] = 'no'
    save_data(_config.group.data, group)
    pm = '<b>Mute Contact Has Been Disabled!</b>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function group_settings(msg, target, group)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup Settings :</b>'
pm = pm..'\n <i>Lock Links : '..group[tostring(target)]['settings']['lock_link']..'</i>'
pm = pm..'\n <i>Lock Username : '..group[tostring(target)]['settings']['lock_username']..'</i>'
pm = pm..'\n <i>Lock Edit : '..group[tostring(target)]['settings']['lock_edit']..'</i>'
pm = pm..'\n <i>Lock Location : '..group[tostring(target)]['settings']['lock_location']..'</i>'
pm = pm..'\n <i>Lock Caption : '..group[tostring(target)]['settings']['lock_caption']..'</i>'
pm = pm..'\n <i>Lock Inline : '..group[tostring(target)]['settings']['lock_inline']..'</i>'
pm = pm..'\n <i>Lock Reply : '..group[tostring(target)]['settings']['lock_reply']..'</i>'
pm = pm..'\n <i>Lock Fwd : '..group[tostring(target)]['settings']['lock_fwd']..'</i>'
pm = pm..'\n <i>Lock Spam : '..group[tostring(target)]['settings']['lock_spam']..'</i>'
pm = pm..'\n <i>Lock English : '..group[tostring(target)]['settings']['lock_english']..'</i>'
pm = pm..'\n <i>Lock Persian : '..group[tostring(target)]['settings']['lock_persian']..'</i>'
pm = pm..'\n <i>Lock TGservice : '..group[tostring(target)]['settings']['lock_tgservice']..'</i>'
pm = pm..'\n <i>Lock Sticker : '..group[tostring(target)]['settings']['lock_sticker']..'</i>'
pm = pm..'\n <b>Mutelist :</b>'
pm = pm..'\n <i>Mute All : '..group[tostring(target)]['settings']['mute_all']..'</i>'
pm = pm..'\n <i>Mute Photo : '..group[tostring(target)]['settings']['mute_photo']..'</i>'
pm = pm..'\n <i>Mute Video : '..group[tostring(target)]['settings']['mute_video']..'</i>'
pm = pm..'\n <i>Mute Contact : '..group[tostring(target)]['settings']['mute_contact']..'</i>'
pm = pm..'\n <i>Mute Voice : '..group[tostring(target)]['settings']['mute_voice']..'</i>'
pm = pm..'\n <i>Mute Document : '..group[tostring(target)]['settings']['mute_document']..'</i>'
pm = pm..'\n <i>Mute Audio : '..group[tostring(target)]['settings']['mute_audio']..'</i>'
pm = pm..'\n <i>Mute Gif : '..group[tostring(target)]['settings']['mute_gif']..'</i>'
bot.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end
local function run(msg, matches)
if is_momod(msg) then
if matches[1] == 'settings'  then
group_settings(msg, msg.chat_id)
elseif matches[1] == 'lock' then
if matches[2] == 'links' then
lock_group_links(msg, msg.chat_id)
elseif matches[2] == 'edit' then
lock_group_edit(msg, msg.chat_id)
elseif matches[2] == 'location' then
lock_group_location(msg, msg.chat_id)
elseif matches[2] == 'caption' then
lock_group_caption(msg, msg.chat_id)
elseif matches[2] == 'inline' then
lock_group_inline(msg, msg.chat_id)
elseif matches[2] == 'reply' then
lock_group_reply(msg, msg.chat_id)
elseif matches[2] == 'fwd' then
lock_group_fwd(msg, msg.chat_id)
elseif matches[2] == 'username' then
lock_group_username(msg, msg.chat_id)
elseif matches[2] == 'spam' then
lock_group_spam(msg, msg.chat_id)
elseif matches[2] == 'english' then
lock_group_english(msg, msg.chat_id)
elseif matches[2] == 'persian' then
lock_group_persian(msg, msg.chat_id)
elseif matches[2] == 'tgservice' then
lock_group_tgservice(msg, msg.chat_id)
elseif matches[2] == 'sticker' then
lock_group_sticker(msg, msg.chat_id)
end
elseif matches[1] == 'unlock' then
if matches[2] == 'links' then
unlock_group_links(msg, msg.chat_id,group )
elseif matches[2] == 'edit' then
unlock_group_edit(msg, msg.chat_id)
elseif matches[2] == 'location' then
unlock_group_location(msg, msg.chat_id)
elseif matches[2] == 'caption' then
unlock_group_caption(msg, msg.chat_id)
elseif matches[2] == 'inline' then
unlock_group_inline(msg, msg.chat_id)
elseif matches[2] == 'reply' then
unlock_group_reply(msg, msg.chat_id)
elseif matches[2] == 'fwd' then
unlock_group_fwd(msg, msg.chat_id)
elseif matches[2] == 'username' then
unlock_group_username(msg, msg.chat_id)
elseif matches[2] == 'spam' then
unlock_group_spam(msg, msg.chat_id)
elseif matches[2] == 'english' then
unlock_group_english(msg, msg.chat_id)
elseif matches[2] == 'persian' then
unlock_group_persian(msg, msg.chat_id)
elseif matches[2] == 'tgservice' then
unlock_group_tgservice(msg, msg.chat_id)
elseif matches[2] == 'sticker' then
unlock_group_sticker(msg, msg.chat_id)
end
elseif matches[1] == 'mute' then
if matches[2] == 'all' then
mute_all_group(msg, msg.chat_id)
elseif matches[2] == 'photo' then
mute_photo_group(msg, msg.chat_id)
elseif matches[2] == 'document' then
mute_document_group(msg, msg.chat_id)
elseif matches[2] == 'contact' then
mute_contact_group(msg, msg.chat_id)
elseif matches[2] == 'gif' then
mute_gif_group(msg, msg.chat_id)
elseif matches[2] == 'audio' then
mute_audio_group(msg, msg.chat_id)
elseif matches[2] == 'voice' then
mute_voice_group(msg, msg.chat_id)
elseif matches[2] == 'video' then
mute_video_group(msg, msg.chat_id)
end
elseif matches[1] == 'unmute' then
if matches[2] == 'all' then
unmute_all_group(msg, msg.chat_id,group )
elseif matches[2] == 'photo' then
unmute_photo_group(msg, msg.chat_id)
elseif matches[2] == 'document' then
unmute_document_group(msg, msg.chat_id)
elseif matches[2] == 'contact' then
unmute_contact_group(msg, msg.chat_id)
elseif matches[2] == 'gif' then
unmute_gif_group(msg, msg.chat_id)
elseif matches[2] == 'audio' then
unmute_audio_group(msg, msg.chat_id)
elseif matches[2] == 'voice' then
unmute_voice_group(msg, msg.chat_id)
elseif matches[2] == 'video' then
unmute_video_group(msg, msg.chat_id)
end
end
end
end
return {
  patterns = {
    "^[/#!](lock) (.*)$",
    "^[/#!](unlock) (.*)$",
    "^[/#!](mute) (.*)$",
    "^[/#!](unmute) (.*)$",
    "^[/#!](settings)$",
    "^!!!edit:[/#!](lock) (.*)$",
    "^!!!edit:[/#!](unlock) (.*)$",
    "^!!!edit:[/#!](mute) (.*)$",
    "^!!!edit:[/#!](unmute) (.*)$",
    "^!!!edit:[/#!](settings)$",
  },
  run = run
}
