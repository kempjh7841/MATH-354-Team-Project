function time_slot = find_best_time(name_of_class, times) 
    majors = ["Econ", "Business"];
    num_majors = [10, 20];
    possible_times = times;
    time_slot_conflicts = zeros(1, length(possible_times));
    
    majors_required_classes = ["Econ 103", "Econ 104", "";
                               "Econ 103", "Math 109", "Math 246"]; %each row is for each major of the majors vector
       
    %num_seats_at_9 = [20, 5, 10];
    
    
    %num_seats_at_10 = [1];
    
    open_seats = [20 , 5 , 10;
                    1 , 0 , 0];
    
    open_classes = ["Econ 104", "Math 109", "Math 246";
                      "Math 246", "", ""]; %each row is for a different time slot (9,10)              
   
    
    
    
    time_slot_index = 1;
    total_conflicts = 0; 
    for ii = 1:length(open_classes(:,1))
         for jj = 1:length(majors)
               total_conflicts = total_conflicts + find_conflicts(open_classes(ii,:), majors_required_classes(jj,:), num_majors(jj));
               total_conflicts = total_conflicts - consider_open_seats(open_seats(ii, :), open_classes(ii, :), majors_required_classes(jj, :), num_majors(jj));
         end
         time_slot_conflicts(time_slot_index) = total_conflicts;
         time_slot_index = time_slot_index + 1;
        % display(total_conflicts);
         total_conflicts = 0;
    end
    
    
    %display(time_slot_conflicts);
    time_slot = possible_times(lowest_conflicts(time_slot_conflicts));
    
    
   %display( consider_open_seats(open_seats(2, :), open_classes(2, :), majors_required_classes(1, :), num_majors(1)));
    
end
