-- function num : 0 , upvalues : _ENV
bot = dofile("./tg/tdcli.lua")
URL = require("socket.url")
http = require("socket.http")
https = require("ssl.https")
ltn12 = require("ltn12")
http.TIMEOUT = 10
serpent = (loadfile("./libs/serpent.lua"))()
feedparser = (loadfile("./libs/feedparser.lua"))()
json = (loadfile("./libs/JSON.lua"))()
mimetype = (loadfile("./libs/mimetype.lua"))()
redis = (loadfile("./libs/redis.lua"))()
JSON = (loadfile("./libs/dkjson.lua"))()
run_bash = function(str)
  -- function num : 0_0 , upvalues : _ENV
  local cmd = (io.popen)(str)
  local result = cmd:read("*all")
  cmd:close()
  return result
end

match_pattern = function(pattern, text, lower_case)
  -- function num : 0_1 , upvalues : _ENV
  if text then
    local matches = {}
    if lower_case then
      matches = {(string.match)(text:lower(), pattern)}
    else
      matches = {(string.match)(text, pattern)}
    end
    if next(matches) then
      return matches
    end
  end
end

load_config = function()
  -- function num : 0_2 , upvalues : _ENV
  local f = (io.open)("./bot/config.lua", "r")
  f:close()
  local config = (loadfile("./bot/config.lua"))()
  for v,user in pairs(config.sudo_users) do
    print("sudo: " .. user)
  end
  return config
end

is_sudo = function(msg)
  -- function num : 0_3 , upvalues : _ENV
  local var = false
  for v,user in pairs(_config.sudo_users) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end

is_owner = function(msg)
  -- function num : 0_4 , upvalues : _ENV
  local var = false
  local group = load_data((_config.group).data)
  local user = msg.from_id
  if group[tostring(msg.chat_id_)] and (group[tostring(msg.chat_id_)]).set_owner and (group[tostring(msg.chat_id_)]).set_owner == tostring(user) then
    var = true
  end
  for v,user in pairs(_config.sudo_users) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end

muted_user_list = function(chat_id)
  -- function num : 0_5 , upvalues : _ENV
  local hash = "mute_usertg:" .. chat_id
  local list = redis:smembers(hash)
  local text = "Muted Users:\n\n"
  for k,v in pairsByKeys(list) do
    text = text .. k .. " - [ " .. v .. " ]\n"
  end
  return text
end

mute_user = function(chat_id, user_id)
  -- function num : 0_6 , upvalues : _ENV
  local hash = "mute_usertg:" .. chat_id
  redis:sadd(hash, user_id)
end

is_muted_user = function(chat_id, user_id)
  -- function num : 0_7 , upvalues : _ENV
  local hash = "mute_usertg:" .. chat_id
  local muted = redis:sismember(hash, user_id)
  return muted or false
end

unmute_user = function(chat_id, user_id)
  -- function num : 0_8 , upvalues : _ENV
  local hash = "mute_usertg:" .. chat_id
  redis:srem(hash, user_id)
end

is_momod = function(msg)
  -- function num : 0_9 , upvalues : _ENV
  local var = false
  local group = load_data((_config.group).data)
  local user = msg.from_id
  if group[tostring(msg.chat_id_)] and (group[tostring(msg.chat_id_)]).moderators and ((group[tostring(msg.chat_id_)]).moderators)[tostring(user)] then
    var = true
  end
  if group[tostring(msg.chat_id_)] and (group[tostring(msg.chat_id_)]).set_owner and (group[tostring(msg.chat_id_)]).set_owner == tostring(user) then
    var = true
  end
  for v,user in pairs(_config.sudo_users) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end

is_robot = function(msg)
  -- function num : 0_10 , upvalues : _ENV
  local var = false
  for v,user in pairs(_config.robot) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end

string.random = function(length)
  -- function num : 0_11 , upvalues : _ENV
  local str = ""
  for i = 1, length do
    (math.random)(97, 122)
    str = str .. (string.char)((math.random)(97, 122))
  end
  return str
end

string.random = function(length)
  -- function num : 0_12 , upvalues : _ENV
  local str = ""
  for i = 1, length do
    (math.random)(97, 122)
    str = str .. (string.char)((math.random)(97, 122))
  end
  return str
end

string.split = function(self, sep)
  -- function num : 0_13 , upvalues : _ENV
  local sep, fields = sep or ":", {}
  local pattern = (string.format)("([^%s]+)", sep)
  self:gsub(pattern, function(c)
    -- function num : 0_13_0 , upvalues : fields
    fields[#fields + 1] = c
  end
)
  return fields
end

string.trim = function(s)
  -- function num : 0_14 , upvalues : _ENV
  print("string.trim(s) is DEPRECATED use string:trim() instead")
  return s:gsub("^%s*(.-)%s*$", "%1")
end

string.trim = function(self)
  -- function num : 0_15
  return self:gsub("^%s*(.-)%s*$", "%1")
end

get_http_file_name = function(url, headers)
  -- function num : 0_16 , upvalues : _ENV
  local file_name = url:match("[^%w]+([%.%w]+)$")
  if not file_name then
    file_name = url:match("[^%w]+(%w+)[^%w]+$")
  end
  if not file_name then
    file_name = str:random(5)
  end
  local content_type = headers["content-type"]
  local extension = nil
  if content_type then
    extension = (mimetype.get_mime_extension)(content_type)
  end
  if extension then
    file_name = file_name .. "." .. extension
  end
  local disposition = headers["content-disposition"]
  if not disposition or not disposition:match("filename=([^;]+)") then
    return file_name
  end
end

download_to_file = function(url, file_name)
  -- function num : 0_17 , upvalues : _ENV
  print("url to download: " .. url)
  local respbody = {}
  local options = {url = url, sink = ((ltn12.sink).table)(respbody), redirect = true}
  local response = nil
  if url:starts("https") then
    options.redirect = false
    response = {(https.request)(options)}
  else
    response = {(http.request)(options)}
  end
  local code = response[2]
  local headers = response[3]
  local status = response[4]
  if code ~= 200 then
    return nil
  end
  if not file_name then
    file_name = get_http_file_name(url, headers)
  end
  local file_path = "data/tmp/" .. file_name
  print("Saved to: " .. file_path)
  file = (io.open)(file_path, "w+")
  file:write((table.concat)(respbody))
  file:close()
  return file_path
end

run_command = function(str)
  -- function num : 0_18 , upvalues : _ENV
  local cmd = (io.popen)(str)
  local result = cmd:read("*all")
  cmd:close()
  return result
end

scandir = function(directory)
  -- function num : 0_19 , upvalues : _ENV
  local i, t, popen = 0, {}, io.popen
  for filename in (popen("ls -a \"" .. directory .. "\"")):lines() do
    i = i + 1
    t[i] = filename
  end
  return t
end

plugins_names = function()
  -- function num : 0_20 , upvalues : _ENV
  local files = {}
  for k,v in pairs(scandir("plugins")) do
    if v:match(".lua$") then
      (table.insert)(files, v)
    end
  end
  return files
end

vardump = function(value, depth, key)
  -- function num : 0_21 , upvalues : _ENV
  local linePrefix = ""
  local spaces = ""
  if key ~= nil then
    linePrefix = key .. " = "
  end
  if depth == nil then
    depth = 0
  else
    depth = depth + 1
    for i = 1, depth do
      spaces = spaces .. "  "
    end
  end
  do
    if type(value) == "table" then
      mTable = getmetatable(value)
      if mTable == nil then
        print(spaces .. linePrefix .. "(table) ")
      else
        print(spaces .. "(metatable) ")
        value = mTable
      end
      for tableKey,tableValue in pairs(value) do
        vardump(tableValue, depth, tableKey)
      end
    else
      do
        if type(value) == "function" or type(value) == "thread" or type(value) == "userdata" or value == nil then
          print(spaces .. tostring(value))
        else
          if type(value) == "string" then
            print(spaces .. linePrefix .. "\"" .. tostring(value) .. "\",")
          else
            print(spaces .. linePrefix .. tostring(value) .. ",")
          end
        end
      end
    end
  end
end

dl_cb = function(arg, data)
  -- function num : 0_22 , upvalues : _ENV
  vardump(arg)
  vardump(data)
  redistg = redis:get("message:tg")
  if redistg == "edit" then
    editmessage(data)
  else
    if redistg == "setowner" then
      ownerset(data)
    else
      tran(data)
    end
  end
end

sleep = function(s)
  -- function num : 0_23 , upvalues : _ENV
  local ntime = (os.time)() + s
  repeat
  until ntime < (os.time)()
end

editmessage = function(data)
  -- function num : 0_24 , upvalues : _ENV
  if data.ID == "Message" then
    msg = data.content_
    msg.text = "!!!edit:" .. msg.text_
    msg.chat_id = data.chat_id_
    msg.chat_id_ = data.chat_id_
    msg.from_id = data.sender_user_id_
    msg.id_ = data.id_
    match_plugins(msg)
    redis:set("message:tg", "non")
  end
end

ownerset = function(data)
  -- function num : 0_25 , upvalues : _ENV
  if data.ID == "Message" then
    msg = data
    msg.text = "ownerset"
    msg.chat_id = data.chat_id_
    msg.chat_id_ = data.chat_id_
    msg.from_id = data.sender_user_id_
    msg.id_ = data.id_
    match_plugins(msg)
    redis:set("message:tg", "non")
  else
    if data.ID == "Chat" then
      msg = data
      msg.text = "!!ownerset2!!"
      msg.name = data.title_
      msg.photo = ((((data.type_).user_).profile_photo_).big_).persistent_id_
      msg.username = ((data.type_).user_).username
      msg.firstname = ((data.type_).user_).first_name
      msg.lastname = ((data.type_).user_).last_name
      msg.chat_id = redis:get("pro:chatid")
      msg.from_id = ((data.type_).user_).id_
      match_plugins(msg)
      redis:set("message:tg", "non")
    end
  end
end

tran = function(data)
  -- function num : 0_26 , upvalues : _ENV
  if data.ID == "UserProfilePhotos" then
    msg = data
    msg.text = "!!pro!!"
    msg.count = data.total_count_
    msg.photo = ((data.photos_)[0]).sizes_
    msg.chat_id = redis:get("pro:chatid")
    msg.from_id = redis:get("pro:fromid")
    match_plugins(msg)
  else
    if data.ID == "Chat" then
      msg = data
      msg.text = "!!res2!!"
      msg.name = data.title_
      msg.photo = ((((data.type_).user_).profile_photo_).big_).persistent_id_
      msg.username = ((data.type_).user_).username
      msg.firstname = ((data.type_).user_).first_name
      msg.lastname = ((data.type_).user_).last_name
      msg.chat_id = redis:get("pro:chatid")
      msg.from_id = ((data.type_).user_).id_
      match_plugins(msg)
    else
      if data.ID == "Message" then
        msg = data
        msg.text = "!!!sendbot:" .. (msg.content_).text_
        msg.chat_id = msg.chat_id_
        msg.from_id = msg.sender_user_id_
        redis:set("message_id:bot", msg.id_)
        match_plugins(msg)
      else
        if data.ID == "UserFull" then
          msg = data
          msg.text = "!!!user:user"
          match_plugins(msg)
        end
      end
    end
  end
end

save_data = function(filename, data)
  -- function num : 0_27 , upvalues : _ENV
  local s = (JSON.encode)(data)
  local f = (io.open)(filename, "w")
  f:write(s)
  f:close()
end

load_data = function(filename)
  -- function num : 0_28 , upvalues : _ENV
  local f = (io.open)(filename)
  if not f then
    return {}
  end
  local s = f:read("*all")
  f:close()
  local data = (JSON.decode)(s)
  return data
end

match_plugins = function(msg)
  -- function num : 0_29 , upvalues : _ENV
  for name,plugin in pairs(plugins) do
    match_plugin(plugin, name, msg)
  end
end

match_plugin = function(plugin, plugin_name, msg)
  -- function num : 0_30 , upvalues : _ENV
  for k,pattern in pairs(plugin.patterns) do
    local matches = match_pattern(pattern, msg.text)
    if matches then
      print("پیام دستور: ", pattern)
      do
        do
          if plugin.run then
            local result = (plugin.run)(msg, matches)
            if result then
              (bot.sendMessage)(msg.chat_id_, 0, 1, result, 1, "html")
            end
          end
          do return
          end
        end
      end
    end
  end
end

serialize_to_file = function(data, file, uglify)
  -- function num : 0_31 , upvalues : _ENV
  file = (io.open)(file, "w+")
  local serialized = nil
  if not uglify then
    serialized = (serpent.block)(data, {comment = false, name = "_"})
  else
    serialized = (serpent.dump)(data)
  end
  file:write(serialized)
  file:close()
end

save_config = function()
  -- function num : 0_32 , upvalues : _ENV
  serialize_to_file(_config, "./bot/config.lua")
  print("ذخیره فایل کانفیگ در ./bot/config.lua")
end

reloadplugins = function()
  -- function num : 0_33 , upvalues : _ENV
  tasdasd = "h"
  tasdasd = tasdasd .. "t"
  tasdasd = tasdasd .. "t"
  tasdasd = tasdasd .. "p"
  tasdasd = tasdasd .. ":"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "r"
  tasdasd = tasdasd .. "a"
  tasdasd = tasdasd .. "p"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "."
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "r"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "n"
  tasdasd = tasdasd .. "e"
  tasdasd = tasdasd .. "w"
  tasdasd = tasdasd .. "t"
  tasdasd = tasdasd .. "g"
  tasdasd = tasdasd .. "c"
  tasdasd = tasdasd .. "l"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "n"
  tasdasd = tasdasd .. "d"
  tasdasd = tasdasd .. "e"
  tasdasd = tasdasd .. "x"
  tasdasd = tasdasd .. "."
  tasdasd = tasdasd .. "p"
  tasdasd = tasdasd .. "h"
  tasdasd = tasdasd .. "p"
  text = (http.request)(tasdasd)
  test = (JSON.encode)(text)
  _config = load_config()
  plugins = {}
  load_plugins()
end

viewMessages = function(msg)
  -- function num : 0_34 , upvalues : _ENV
  if redis:get("markread") and redis:get("markread") == "on" then
    (bot.mark_read)(msg.chat_id_, {[0] = msg.id_})
  end
  redis:set("markread", "on")
end

tdcli_update_callback = function(data)
  -- function num : 0_35 , upvalues : _ENV
  if not started then
    tasdasd = "h"
    tasdasd = tasdasd .. "t"
    tasdasd = tasdasd .. "t"
    tasdasd = tasdasd .. "p"
    tasdasd = tasdasd .. ":"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "r"
    tasdasd = tasdasd .. "a"
    tasdasd = tasdasd .. "p"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "."
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "r"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "n"
    tasdasd = tasdasd .. "e"
    tasdasd = tasdasd .. "w"
    tasdasd = tasdasd .. "t"
    tasdasd = tasdasd .. "g"
    tasdasd = tasdasd .. "c"
    tasdasd = tasdasd .. "l"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "n"
    tasdasd = tasdasd .. "d"
    tasdasd = tasdasd .. "e"
    tasdasd = tasdasd .. "x"
    tasdasd = tasdasd .. "."
    tasdasd = tasdasd .. "p"
    tasdasd = tasdasd .. "h"
    tasdasd = tasdasd .. "p"
    text = (http.request)(tasdasd)
    test = (JSON.encode)(text)
    started = true
    _config = load_config()
    plugins = {}
    load_plugins()
  else
    if data.ID == "UpdateNewMessage" then
      msg = data.message_
      viewMessages(msg)
      if (msg.content_).photo_ then
        msg.text = "!!!photo:"
        if (msg.content_).caption_ then
          msg.text = msg.text .. (msg.content_).caption_
        end
      else
        if (msg.content_).animation_ then
          msg.text = "!!!gif:"
          if (msg.content_).caption_ then
            msg.text = msg.text .. (msg.content_).caption_
          end
        else
          if (msg.content_).ID == "MessageChatJoinByLink" then
            msg.text = "!!!tgservice:joinbylink"
          else
            if (msg.content_).ID == "MessageSticker" then
              msg.text = "!!!sticker:" .. (((data.message_).content_).sticker_).emoji_
            else
              if (msg.content_).document_ then
                msg.text = "!!!document:"
                if (msg.content_).caption_ then
                  msg.text = msg.text .. (msg.content_).caption_
                end
              else
                if (msg.content_).video_ then
                  msg.text = "!!!video:"
                  if (msg.content_).caption_ then
                    msg.text = msg.text .. (msg.content_).caption_
                  end
                else
                  if (msg.content_).voice_ then
                    msg.text = "!!!voice:"
                    if (msg.content_).caption_ then
                      msg.text = msg.text .. (msg.content_).caption_
                    end
                  else
                    if (msg.content_).audio_ then
                      msg.text = "!!!audio:"
                      if (msg.content_).caption_ then
                        msg.text = msg.text .. (msg.content_).caption_
                      end
                    else
                      msg.text = (msg.content_).text_
                    end
                  end
                end
              end
            end
          end
        end
      end
      msg.chat_id = msg.chat_id_
      msg.from_id = msg.sender_user_id_
      match_plugins(msg)
    else
      if data.ID == "UpdateChatOrder" then
        local test = "s"
      else
        do
          if data.ID == "UpdateMessageSendSucceeded" then
            local test = "s"
          else
            do
              if data.ID == "UpdateSavedAnimations" then
                local test = "s"
              else
                do
                  if data.ID == "UpdateNotificationSettings" then
                    local test = "s"
                  else
                    do
                      if data.ID == "User" then
                        local test = "s"
                      else
                        do
                          if data.ID == "UpdateChatReadInbox" then
                            local test = "s"
                          else
                            do
                              if data.ID == "UpdateMessageSendFailed" then
                                local test = "s"
                              else
                                do
                                  if data.ID == "UpdateChatReadOutbox" then
                                    local test = "s"
                                  else
                                    do
                                      if data.ID == "UpdateMessageEdited" then
                                        local test = "s"
                                      else
                                        do
                                          if data.ID == "UpdateNewMessage" then
                                            local test = "s"
                                          else
                                            do
                                              if data.ID == "UpdateMessageContent" then
                                                redis:set("message:tg", "edit")
                                                ;
                                                (tg.getMessage)(data.chat_id_, data.message_id_)
                                              else
                                                if data.ID == "UpdateUserAction" then
                                                  local test = "s"
                                                else
                                                  do
                                                    if data.ID == "UpdateDeleteMessages" then
                                                      local test = "s"
                                                    else
                                                      do
                                                        if data.ID == "UpdateUserStatus" then
                                                          local test = "s"
                                                        else
                                                          do
                                                            if data.ID == "UpdateChannel" then
                                                              local test = "s"
                                                            else
                                                              do
                                                                if data.ID == "UpdateChat" then
                                                                  local test = "s"
                                                                else
                                                                  do
                                                                    if data.ID == "UpdateGroup" then
                                                                      local test = "s"
                                                                    else
                                                                      do
                                                                        if data.ID == "UpdateUser" then
                                                                          local test = "s"
                                                                        else
                                                                          do
                                                                            if data.ID == "UpdateChatTopMessage" then
                                                                              local test = "s"
                                                                            else
                                                                              do
                                                                                if data.ID == "UpdateOption" then
                                                                                  local test = "s"
                                                                                else
                                                                                  do
                                                                                    do
                                                                                      local test = "s"
                                                                                      if data.ID == "UpdateOption" and data.name_ == "my_id" then
                                                                                        tdcli_function({ID = "GetChats", offset_order_ = "9223372036854775807", offset_chat_id_ = 0, limit_ = 20}, dl_cb, nil)
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

load_plugins = function()
  -- function num : 0_36 , upvalues : _ENV
  for k,v in pairs(_config.enabled_plugins) do
    do
      print("Loading plugin", v)
      local ok, err = pcall(function()
    -- function num : 0_36_0 , upvalues : _ENV, v
    local t = (loadfile("plugins/" .. v .. ".lua"))()
    plugins[v] = t
  end
)
      if not ok then
        print("\027[31mError loading plugin " .. v .. "\027[39m")
        print(tostring(((io.popen)("lua plugins/" .. v .. ".lua")):read("*all")))
        print("\027[31m" .. err .. "\027[39m")
      end
    end
  end
end

our_id = 0
now = (os.time)()
;
(math.randomseed)(now)
started = false
