for k, v in pairs(data.raw.resource) do
   if not data.raw.resouce[k].infinite then
        data.raw.resource[k].infinite = true
        data.raw.resource[k].minimum  = 175
        data.raw.resource[k].normal   = 350
    end
end