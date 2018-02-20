function time_slot_position = lowest_conflicts(conflicts)
   time_slot_position = 1;
   lowest_conflicts = conflicts(1);
   for ii = 1:length(conflicts)
       if conflicts(ii) < lowest_conflicts
           lowest_conflicts = conflicts(ii);
           time_slot_position = ii; 
       end
   end
end
