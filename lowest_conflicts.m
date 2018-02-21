function time_slot_position = lowest_conflicts(conflicts)
   time_slot_position = 1;                   % this intializes the time slot variable, we use this to scroll through the times available. In this case 1 means 9am.
   lowest_conflicts = conflicts(1);          % this sets the values of lowest conflicts to the first position of the conflicts (which is passed in) vector .
   for ii = 1:length(conflicts)              % this for loop is used to search through the entire conflict vector
       if conflicts(ii) < lowest_conflicts   % once a lower value of conflicts is found, this if statement will replace the value of lowest conflicts to that positions value.
           lowest_conflicts = conflicts(ii);
           time_slot_position = ii; 
       end % ends if statement
   end % ends for loop
end % ends function                         % the function returns the lowest value position of the vector conflicts.
