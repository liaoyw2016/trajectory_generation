function [trajectory] = get_straight_trajectory(initial_pos,initial_vel,sim_time,dt)
    time_steps = ceil(sim_time/dt);
    trajectory.t   = zeros(1,                 ,time_steps);
    trajectory.pos = zeros(length(initial_pos),time_steps);
    trajectory.vel = zeros(length(initial_vel),time_steps);
    
    current_time = 0;
    trajectory.current_time = current_time;
    trajectory.pos(:,1) = initial_pos;
    for t = 2:time_steps
        current_time = (t-1)*dt;
        trajectory.current_time = current_time;
        trajectory.pos(:,t) = trajectory.pos(:,t-1) + dt*initial_vel;
        trajectory.vel(:,t) = initial_vel;
    end
end