function conflicts = find_conflicts(open_classes_at_time_slot, major_required, students_in_major) %add param for open_seats, ii, jj
    conflicts = 0; 
    for ii = 1 : length(open_classes_at_time_slot)
        for jj = 1 : length(major_required)
            if (open_classes_at_time_slot(ii) ~= "" && major_required(jj) ~= "")
                conflicts = conflicts + strcmp(open_classes_at_time_slot(ii),major_required(jj));
            end
        end
    end
    conflicts = conflicts * students_in_major;
    %conflicts = conflicts - consider_open_seats(open_seats, ii, jj);
end
