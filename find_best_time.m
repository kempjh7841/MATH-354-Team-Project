%returns a string of the best time slot; takes a string of the class user
%wants to input, and a vector of the available times
function time_slot = find_best_time(name_of_class, times) 
    majors = ["Econ", "Business"]; %list of majors (to be implemented with Excel file
    num_majors = [10, 20]; %corresponds to majors vector; 10 econ majors, 20 business majors, etc.
    possible_times = times;
    time_slot_conflicts = zeros(1, length(possible_times));
    
    majors_required_classes = ["Econ 103", "Econ 104", "";
                               "Econ 103", "Math 109", "Math 246"]; %each row is for each major of the majors vector
       
    open_seats = [20 , 5 , 10;
                    1 , 0 , 0]; %each row corresponds to each time slot, each column represents the open seats in its corresponding class below
    
    open_classes = ["Econ 104", "Math 109", "Math 246";
                      "Math 246", "", ""]; %each row is for a different time slot (9,10)              
   
    time_slot_index = 1;
    total_conflicts = 0; 
    for ii = 1:length(open_classes(:,1))
         for jj = 1:length(majors)
               total_conflicts = total_conflicts + find_conflicts(open_classes(ii,:), majors_required_classes(jj,:), num_majors(jj)); %find conflicts for each major at each time slot
               total_conflicts = total_conflicts - consider_open_seats(open_seats(ii, :), open_classes(ii, :), majors_required_classes(jj, :), num_majors(jj)); %subtract conflicts that do won't exist because of enrollment
         end %ends for loop for each major
         time_slot_conflicts(time_slot_index) = total_conflicts; %set the amount of conflics at each time period into the vector
         time_slot_index = time_slot_index + 1; %move the index of the next spot
         total_conflicts = 0;
    end %ends for loop for each time slot 
    
    time_slot = possible_times(lowest_conflicts(time_slot_conflicts)); 
end %ends find_best_time function
