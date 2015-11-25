local StackSize = 100000
for _,dat in pairs(data.raw) do
   for _,items in pairs(dat) do
      if items.stack_size and items.stack_size>1 then
         items.stack_size = StackSize
      end
   end
end