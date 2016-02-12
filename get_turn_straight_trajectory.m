function [trajectory] = get_turn_straight_trajectory(initial_state,turn_char,straight_char,final_position,dt)
    %state.pos = [x;y];
    %state.vel = [x;y];

    %turn_char.spd = (scalar magnitude)
    %turn_char.acc = (scalar magnitude)
    %turn_char.R = (spd^2/a)
    %turn_char.w = (spd/a)

    %straight_char.spd = (scalar magnitude)

    %final_position = [x;y];

    yaw = atan2(initial_state.vel(1),initial_state.vel(2));
    yaw*180/pi
    Yrot = get_yaw_matrix_2d(yaw);
    Yrotm = transpose(Yrot) %Ymat^T = Ymat^-1
    final_pos_rot = Yrotm*final_position
    [arc_angle,direction] = get_arc_angle(turn_char.R,final_pos_rot(1),final_pos_rot(2))
    % direction is a string of ['invalid','straight','right','left']


    %a right turn is +Yaw
    if(strcmp(direction,'right')==1)
        W_y_ = 1*turn_char.w;
    elseif(strcmp(direction,'left')==1)
        W_y = -1*turn_char.w;
    else
        W_y =  0; %invalid or straight
    end

    if(strcmp(direction,'right')==1 || strcmp(direction,'left')==1)
        time_to_sim_rot = (arc_angle*pi/180)/abs(W_y);

    elseif(strcmp(direction,'straight'))
        %fill in later
    else %invalid
        %drive straight a bit then repeat get_turn_straight_trajectory
    end
end