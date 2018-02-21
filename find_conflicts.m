% Returns the number of students with a conflict based on the classes
% they are required to take for their major
% open_classes_at_time_slot is one row of the matrix of strings of classes offered
% at each time
% major_required is one row ofthe matrix of strings of classes required for each 
% major (each row is different major)
% students_in_major is one entry (one major) of the vector of students per major 
function conflicts = find_conflicts(open_classes_at_time_slot, major_required, ...
    students_in_major) % add param for open_seats if applicable
    conflicts = 0;  % initialize conflicts to 0
    for ii = 1 : length(open_classes_at_time_slot) % iterate through offered classes
        for jj = 1 : length(major_required) % iterate through required classes
            if (open_classes_at_time_slot(ii) ~= "" && major_required(jj) ~= "")
                %^ensure that the string in matrix entry is not empty
                conflicts = conflicts + strcmp(open_classes_at_time_slot(ii), ...
                    major_required(jj)); % check to see if a required class is offered
                    %if a required class is offered, strcmp = 1
            end % end if
        end % end for loop required classes
    end % end for loop offered classes
    conflicts = conflicts * students_in_major; 
    % ^assume all open seats for required classes will be filled
    %conflicts = conflicts - consider_open_seats(open_seats, ii, jj);
end % end function
