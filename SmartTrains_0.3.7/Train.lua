Train = {

    new = function(train)
      if train.valid then
        local new = {
          train = train,
          dynamic = false,
          line = false,
          lineVersion = 0,
          settings = {},
          waiting = false,
          refueling = false,
          advancedState = false,
          cargo = {},
          cargoUpdated = 0,
          direction = 0 -- 0 = front, 1 back
        --manualMode = train.manual_mode
        }
        new.settings.autoDepart = defaultTrainSettings.autoDepart
        new.settings.autoRefuel = defaultTrainSettings.autoRefuel
        if train.locomotives ~= nil and (#train.locomotives.front_movers > 0 or #train.locomotives.back_movers > 0) then
          new.name = train.locomotives.front_movers[1].backer_name or train.locomotives.back_movers[1].backer_name
        else
          new.name = "cargoOnly"
        end
        setmetatable(new, {__index = Train})
        new.type = new:getType()
        return new
      end
    end,

    getType = function(self)
      local type = string.rep("L",#self.train.locomotives.front_movers).."-"..string.rep("C", #self.train.cargo_wagons).."-"..string.rep("L",#self.train.locomotives.back_movers)
      type = string.gsub(type, "L%-%-L", "LL")
      return string.gsub(string.gsub(type, "^-", ""), "-$", "")
    end,

    printName = function(self)
      debugDump(self.name, true)
    end,

    nextStation = function(self, force, index)
      local train = self.train
      if self.settings.autoRefuel then
        if self:lowestFuel() < (global.settings.refuel.rangeMin) and not inSchedule(self:refuelStation(), train.schedule) then
          train.schedule = addStation(self:refuelStation(), train.schedule, global.settings.refuel.time)
          self:flyingText("Refuel station added", YELLOW)
        end
      end
      if train.manual_mode == false or force then
        local schedule = train.schedule
        local tmp = (schedule.current % #schedule.records) + 1
        if index and index > 0 and index <= #schedule.records then
          tmp = index
          self:flyingText("Going to "..schedule.records[index].station, YELLOW, {offset = -1})
        end
        train.manual_mode = true
        schedule.current = tmp
        train.schedule = schedule
        train.manual_mode = false
      end
    end,

    refuelStation = function(self)
      local station = global.settings.refuel.station
      local refuelStation = station.." "..self:getType()
      for name, c in pairs(global.stationCount) do
        if name == refuelStation then
          return refuelStation
        end
      end
      return station
    end,

    startRefueling = function(self)
      self.refueling = {nextCheck = game.tick + global.settings.depart.interval}
      --debugDump({refuel= util.formattime(game.tick)},true)
      local tick = self.refueling.nextCheck
      if not global.ticks[tick] then
        global.ticks[tick] = {self}
      else
        table.insert(global.ticks[tick], self)
      end
    end,

    isRefueling = function(self)
      return type(self.refueling) == "table" and self.settings.autoRefuel
    end,

    refuelingDone = function(self, done)
      if done then
        self.refueling = false
        self:nextStation()
      end
    end,

    removeRefuelStation = function(self)
      if inSchedule(self:refuelStation(), self.train.schedule) and #self.train.schedule.records >= 3 then
        self.train.schedule = removeStation(self:refuelStation(), self.train.schedule)
        self:flyingText("Refuel station removed", YELLOW)
      end
    end,

    currentStation = function(self)
      if self.train.valid and type(self.train.schedule.records) == "table" and self.train.schedule.records[self.train.schedule.current] then
        return self.train.schedule.records[self.train.schedule.current].station
      else
        return false
      end
    end,

    startWaitingForAutoDepart = function(self)
      self.waiting = {cargo = self:cargoCount(), lastCheck = game.tick, nextCheck = game.tick + global.settings.depart.minWait}
      local tick = self.waiting.nextCheck
      insertInTable(global.ticks, tick, self )
    end,

    isWaitingForAutoDepart = function(self)
      return type(self.waiting) == "table" and type(self.waiting.cargo) == "table" and self.settings.autoDepart --and self.train.manual_mode == false
    end,

    waitingDone = function(self, done, index)
      if done then
        local force = self.waitForever or false
        self:resetCircuitSignal()
        self.waiting = false
        self:nextStation(force, index)
        --debugDump("waitForever unset")
        self.waitForever = false
      end
    end,

    startWaitingForRules = function(self)
      if not self.waiting then
        self.waiting = {lastCheck = game.tick, nextCheck = game.tick + global.settings.depart.minWait, signalProxy = false}
        local rules = (self.line and global.trainLines[self.line] and global.trainLines[self.line].rules) and global.trainLines[self.line].rules[self.train.schedule.current] or false
        self.waitForever = false
        if rules then
          if rules.keepWaiting then
            --debugDump(util.formattime(game.tick,true).." waitForever set",true)
            self.waitForever = true
            insertInTable(global.stopTick, game.tick+5, self)
          end
          if rules.waitForCircuit then
            self.waiting.nextCheck = game.tick + 5 + global.settings.circuit.interval
          end
        end
        local tick = self.waiting.nextCheck
        insertInTable(global.ticks, tick, self)
      end
    end,

    isWaitingForRules = function(self)
      local rules = self.line and global.trainLines[self.line] and global.trainLines[self.line].rules and global.trainLines[self.line].rules[self.train.schedule.current]
      return type(self.waiting) == "table" and rules
    end,

    isWaiting = function(self)
      return type(self.waiting) == "table"
    end,

    -- return true when at a smart train stop
    setWaitingStation = function(self)
      local vehicle = (self.direction and self.direction == 0) and self.train.carriages[1] or self.train.carriages[#self.train.carriages]
      --self:flyingText("V", GREEN, {offset=vehicle.position})
      local station = findSmartTrainStopByTrain(vehicle, self.train.schedule.records[self.train.schedule.current].station)
      local proxy, cargoProxy = false, false
      if station then
        local smartStop = global.smartTrainstops[stationKey(station)]
        --self:flyingText("S", GREEN, {offset=station.position})
        proxy = (smartStop and smartStop.proxy) and smartStop.proxy or false
        cargoProxy = (smartStop and smartStop.cargo) and smartStop.cargo or false
      end
      self.waitingStation = {station = station, signalProxy = proxy, cargoProxy = cargoProxy}
      self:setCircuitSignal()
      return station and proxy and cargoProxy
    end,

    getCircuitSignal = function(self)
      if self.waitingStation and self.waitingStation.signalProxy and self.waitingStation.signalProxy.valid then
        local condition = self.waitingStation.signalProxy.get_circuit_condition(1)
        local signal = (condition.condition and condition.condition.first_signal and condition.condition.first_signal.name) and condition.condition.first_signal or false
        local signalTrue = condition.fulfilled and self.waitingStation.signalProxy.energy > 0
        local signalValue =  (signal and signal.name) and deduceSignalValue(self.waitingStation.signalProxy, signal, 1) or false
        return signalTrue, signalValue
      end
      return false, false
    end,

    setCircuitSignal = function(self)
      if self.waitingStation and self.waitingStation.cargoProxy and self.waitingStation.cargoProxy.valid then
        local cargoProxy = self.waitingStation.cargoProxy
        local output = cargoProxy.get_circuit_condition(1)
        local cargoCount = self:cargoCount()
        for c=1,50 do
          output.parameters[c]={signal={type = "item", name = nil}, count = 1, index = c}
        end
        output.parameters[1]={signal={type = "virtual", name = "signal-train-at-station"}, count = 1, index = 1}
        output.parameters[2]={signal={type = "virtual", name = "signal-locomotives"}, count = #self.train.locomotives.front_movers+#self.train.locomotives.back_movers, index = 2}
        output.parameters[3]={signal={type = "virtual", name = "signal-cargowagons"}, count = #self.train.cargo_wagons, index = 3}
        local i=4
        for name, count in pairs(cargoCount) do
          local type = "item"
          if game.fluid_prototypes[name] then
            type = "fluid"
            count = math.floor(count)
          end
          output.parameters[i]={signal={type = type, name = name}, count=count, index = i}
          i=i+1
          if i>50 then break end
        end
        for c=i,50 do
          output.parameters[i]={signal={type = "item", name = nil}, count = 1, index = c}
        end
        cargoProxy.set_circuit_condition(1,output)
      end
    end,

    resetCircuitSignal = function(self)
      if self.waitingStation and self.waitingStation.cargoProxy and self.waitingStation.cargoProxy.valid then
        local cargoProxy = self.waitingStation.cargoProxy
        local output=cargoProxy.get_circuit_condition(1)

        output.parameters[1]={signal={type = "virtual", name = "signal-train-at-station"}, count = 0, index = 1}
        output.parameters[2]={signal={type = "virtual", name = "signal-locomotives"}, count = 0, index = 2}
        output.parameters[3]={signal={type = "virtual", name = "signal-cargowagons"}, count = -1, index = 3}
        for i=4,50 do
          output.parameters[i]={signal={type = "item", name = nil}, count = 1, index = i}
        end
        cargoProxy.set_circuit_condition(1,output)
      end
    end,

    --returns fuelvalue (in MJ)
    lowestFuel = function(self)
      local minfuel = nil
      local c
      local locos = self.train.locomotives
      if locos ~= nil then
        for i,carriage in pairs(locos.front_movers) do
          c = self:calcFuel(carriage.get_inventory(1).get_contents())
          if minfuel == nil or c < minfuel then
            minfuel = c
          end
        end
        for i,carriage in pairs(locos.back_movers) do
          c = self:calcFuel(carriage.get_inventory(1).get_contents())
          if minfuel == nil or c < minfuel then
            minfuel = c
          end
        end
        return minfuel
      else
        return 0
      end
    end,

    calcFuel = function(self, contents)
      local value = 0
      --/c game.player.print(game.player.character.vehicle.train.locomotives.front_movers[1].energy)
      for i, c in pairs(contents) do
        value = value + c*fuelvalue(i)
      end
      return value
    end,

    cargoCount = function(self)
      if self.cargoUpdated + global.settings.circuit.interval - 1 < game.tick then
        local sum = {}
        local train = self.train
        --sum = train.get_contents()
        for i, wagon in pairs(train.carriages) do
          if wagon.type == "cargo-wagon" then
            if wagon.name ~= "rail-tanker" then
              --sum = sum + wagon.getcontents()
              sum = addInventoryContents(sum, wagon.get_inventory(1).get_contents())
            else
              if remote.interfaces.railtanker and remote.interfaces.railtanker.getLiquidByWagon then
                local d = remote.call("railtanker", "getLiquidByWagon", wagon)
                if d.type ~= nil then
                  sum[d.type] = sum[d.type] or 0
                  sum[d.type] = sum[d.type] + d.amount
                  --self:flyingText(d.type..": "..d.amount, YELLOW, {offset={x=wagon.position.x,y=wagon.position.y+1}})
                end
              end
            end
          end
        end
        self.cargo = sum
        self.cargoUpdated = game.tick
      end
      return self.cargo
    end,

    cargoEquals = function(self, c1, c2, minFlow, interval)
      local liquids1 = {}
      local liquids2 = {}
      local goodflow = false
      local fluids = game.fluid_prototypes
      for l,_ in pairs(fluids) do
        liquids1[l], liquids2[l] = false, false
        if c1[l] ~= nil or c2[l] ~= nil then
          liquids1[l] = c1[l] or 0
          liquids2[l] = c2[l] or 0
          local flow = (liquids1[l] - liquids2[l])/(interval/60)
          if math.abs(flow) >= minFlow then goodflow = true end
          --self:flyingText("flow: "..flow, YELLOW, {offset=1})
          c1[l] = nil
          c2[l] = nil
        end
      end
      local eq = table.compare(c1, c2)
      for l,_ in pairs(fluids) do
        if liquids1[l] ~= false and liquids1[l] > 0 then c1[l] = liquids1[l] end
        if liquids2[l] ~= false and liquids2[l] > 0 then c2[l] = liquids2[l] end
      end
      return (eq and not goodflow)
    end,

    isCargoEmpty = function(self)
      local train = self.train
      for i, wagon in pairs(train.carriages) do
        if wagon.type == "cargo-wagon" then
          if wagon.name ~= "rail-tanker" then
            if not wagon.get_inventory(1).is_empty() then
              return false
            end
          else
            if remote.interfaces.railtanker and remote.interfaces.railtanker.getLiquidByWagon then
              local d = remote.call("railtanker", "getLiquidByWagon", wagon)
              if d.type ~= nil then
                if math.floor(d.amount) > 0 then
                  return false
                end
              end
            end
          end
        end
      end
      return true
    end,

    isCargoFull = function(self)
      local train = self.train
      for i, wagon in pairs(train.carriages) do
        if wagon.type == "cargo-wagon" then
          if wagon.name ~= "rail-tanker" then
            local inv = wagon.get_inventory(1)
            --check if all slots are blocked
            if inv.hasbar() and inv.getbar() == 0 then
              return false
            end
            if inv.can_insert{name="railgun", count=1} then
              --inserted railgun -> at least 1 slot is free
              return false
            end
            -- check if all stacks are full
            local contents = inv.get_contents()
            for item, count in pairs(contents) do
              if inv.can_insert{name=item, count=1} then
                return false
              end
            end
            -- all stacks are full,
          else
            if remote.interfaces.railtanker and remote.interfaces.railtanker.getLiquidByWagon then
              local d = remote.call("railtanker", "getLiquidByWagon", wagon)
              if d.type ~= nil then
                if math.ceil(d.amount) < 2500 then
                  return false
                end
              end
            end
          end
        end
      end
      return true
    end,

    updateState = function(self)
      --debugDump(util.formattime(game.tick,true).."@ "..getKeyByValue(defines.trainstate, self.train.state),true)
      self.previousState = self.state
      self.state = self.train.state
      if self.previousState == defines.trainstate["wait_station"] and self.state == defines.trainstate["on_the_path"] then
        self.advancedState = defines.trainstate["left_station"]
      else
        self.advancedState = false
      end
    end,

    updateLine = function(self)
      if self.line and global.trainLines[self.line] then
        if self.settings.autoRefuel and self.train.schedule.current == inSchedule(self:refuelStation(), self.train.schedule) then
          --self:flyingText("Skipping line update", YELLOW)
          return
        end
        local trainLine = global.trainLines[self.line]
        if self.line and trainLine.changed > self.lineVersion then
          if self.lineVersion >= 0 then
            self:flyingText("updating schedule", YELLOW)
          end
          local waitingAt = self.train.schedule.records[self.train.schedule.current] or {station="", time_to_wait=0}
          local oldmode = self.train.manual_mode
          self.train.manual_mode = true
          local schedule = {records={}}
          for i, record in pairs(trainLine.records) do
            schedule.records[i] = record
          end
          local inLine = inSchedule(waitingAt.station,schedule)
          if inLine then
            schedule.current = inLine
          else
            schedule.current = 1
          end
          self.train.schedule = schedule
          self.settings.autoRefuel = trainLine.settings.autoRefuel
          self.settings.autoDepart = trainLine.settings.autoDepart
          self.train.manual_mode = oldmode
          self.lineVersion = trainLine.changed
        end
      elseif self.line and not global.trainLines[self.line] then
        self:flyingText("Dettached from line", RED)
        self.waitForever = false
        self.line = false
        self.lineVersion = false
      end
    end,

    nextValidStation = function(self)
      local schedule = self.train.schedule
      local train = self.train
      local old = schedule.current
      local tmp = schedule.current
      local rules = global.trainLines[self.line].rules
      local skipped, c = "", 0
      if self.line and rules[tmp] and not (inSchedule(global.settings.refuel.station, schedule) and self.settings.autoRefuel) then
        local cargo = self:cargoCount()
        local filter = rules[tmp].filter
        local filter = filter:match("st%-fluidItem%-(.+)") or rules[tmp].filter
        local item = cargo[filter] or 0
        local compare = rules[tmp].condition
        if compare == "=" then compare = "==" end
        local cond = string.format("return %f %s %f", item, compare, rules[tmp].count)
        local f = assert(loadstring(cond))()
        --debugDump({cond, f},true)
        if not f then
          skipped = schedule.records[tmp].station
          c = c+1
          for i=1,#schedule.records do
            local k = math.abs(i + tmp - 1) % (#schedule.records)+1
            if not rules[k] then
              tmp = k
              break
            else
              local cargo = self:cargoCount()
              local filter = rules[k].filter
              local filter = filter:match("st%-fluidItem%-(.+)") or rules[k].filter
              local item = cargo[filter] or 0
              local item = cargo[rules[k].filter] or 0
              local compare = rules[k].condition
              if compare == "=" then compare = "==" end
              local cond = string.format("return %f %s %f", item, compare, rules[k].count)
              local f = assert(loadstring(cond))()
              --debugDump({cond, f},true)
              if f then
                tmp = k
                break
              end
              skipped = skipped..", "..schedule.records[k].station
              c=c+1
            end
          end
        end
        if #schedule.records <= c+1 then
          if global.settings.lines.forever then
            self:flyingText("Invalid rules", RED, {offset=1, show=true})
            local prevStation = (schedule.current-2) % #schedule.records + 1
            train.manual_mode = true
            schedule.current = prevStation
            train.schedule = schedule
            train.manual_mode = false
            return
          else

          end
        elseif skipped ~= "" then
          self:flyingText("Skipped stations: "..skipped, YELLOW, {offset=1})
        end
        assert(tmp <= #schedule.records)
        --debugDump("going to "..schedule.records[tmp].station, true)
        train.manual_mode = true
        schedule.current = tmp
        train.schedule = schedule
        train.manual_mode = false
      end
    end,

    flyingText = function(self, msg, color, tbl)
      local s = global.showFlyingText
      local offset = 0
      if type(tbl) == "table" then
        s = tbl.show or s
        offset = tbl.offset or offset
      end
      local pos = self.train.carriages[1].position
      if type(offset) == "table" then
        pos = offset
      elseif type(offset) == "number" then
        pos.y = pos.y + offset
      end
      if s then self.train.carriages[1].surface.create_entity({name="flying-text", position=pos, text=msg, color=color}) end
    end
}
Train.__eq = function(trainA, trainB)
  return trainA.train.carriages[1] == trainB.train.carriages[1]
end
