inital_state.pos = [0;0];
initial_state.pos = [0;0];
initial_state.vel = [0;-1];
turn_char.spd = 2;
turn_char.acc = 1;
turn_char.R = (turn_char.spd^2/turn_char.acc);
turn_char.w = (turn_char.acc/turn_char.spd);
straight_char.spd = 1;
final_position = [5;5];
dt = 0.1;
[trajectory] = get_turn_straight_trajectory(initial_state,turn_char,straight_char,final_position)