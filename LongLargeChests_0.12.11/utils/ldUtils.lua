-----------------------------------------------------------
-- Everything is prefixed with ldUtils_
-----------------------------------------------------------

-----------------------------------------------------------
-- utility functions
-- remove a value from a table.
-----------------------------------------------------------
function ldUtils_removeByVal(tab, item)
  local count = 0;
  local keys = {};
  local values = {};
  local removed = 0;
  for k,v in pairs(tab)
  do
    if(v ~= item)
    then
      count = count + 1;
      keys[count] = k;
      values[count] = v;
    else
      removed = removed + 1;
    end
  end
  if(removed < 1)
  then
    return tab;
  end
  tab = {};
  if(count > 0)
  then
    for i = 1, count
    do
      tab[keys[i]] = values[i];
    end
  end
  return tab;
end

-----------------------------------------------------------
-- utility functions
-- /c print = function(s)  game.player.print(s) end
-- /c sel = function() return game.player.selected end
-- /c print("help = " .. sel().help())
-----------------------------------------------------------

-----------------------------------------------------------
-- utility functions
-----------------------------------------------------------
function ldUtils_debugMsg(s)
  for index, player in pairs(game.players) do
    if(player.valid) then
      player.print(s);
    end;
  end
end

function ldUtils_toString(attr, prefix, nil_val)
  if(nil ~= attr)
  then
    return prefix .. attr;
  else
    return nil_val or (prefix .. "[nil]");
  end
end

-----------------------------------------------------------
-- utility functions
-----------------------------------------------------------
function ldUtils_debugObj(prefix, o)
  if (o == nil)
  then
    ldUtils_debugMsg(prefix .. " is nil")
  else
    local msg = prefix .. ldUtils_toString(o.name, " name=", " (unknown name)") .. ldUtils_toString(o.type, ", type=", ", (unknown type)");
    ldUtils_debugMsg(msg);
  end
end
