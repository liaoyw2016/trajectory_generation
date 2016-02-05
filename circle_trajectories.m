%%
clc;
clear all;
pointStruct_2_matrix = @(ps) [ps.x(:)';ps.y(:)'];
 
yaw_m_rot = @(theta) [[cos(theta),-sin(theta)];[sin(theta),cos(theta)]];
yaw_p_rot = @(theta) (yaw_p_rot(theta))';

g = 9.8;
a = 3*g;
V = 100;
Ts = .01;


initial_heading = 0;


angles = [179.99,45,-45,-135,-134]*pi/180;
centers = 80*[[1,0]',[-1,0]'];
points = zeros(2,length(angles)*size(centers,2));
a = 1;
for ii=1:size(centers,2)
    for jj=1:length(angles)
        points(:,a) = 80*[cos(angles(jj)),sin(angles(jj))]'+centers(:,ii);
        a = a+1;
    end
end

points(:,1) = [0.1,-5]';%'

%points = [ ...
%%    [ 0.5, 1  ]', ...
%    [ 1  ,  .5]', ...
%    [ 1  ,-0.5]', ...
%    [  .5,-1  ]', ...
%    [-0.5, 1  ]', ...
%    [-1  , 0.5]', ...
%    [-1  ,-0.5]', ...
%    [-0.5,-1  ]', ...
%
%];

trajectory.t = [0];
trajectory.x = [0];
trajectory.y = [0];
trajectory.xd = [0];
trajectory.yd = [0];
trajectory.yaw = [0];

for ii = 1:size(points,2)
    origin = [trajectory.x(end),trajectory.y(end)]';
    initial_heading = trajectory.yaw(end)*pi/180;
    p = points(:,ii)-origin;
    p = yaw_m_rot(initial_heading)*p;
    point.x = p(1);
    point.y = p(2);

    R = abs((point.x^2+point.y^2)/(2*point.x));
    omega = sqrt(V^2/R^2);
    theta = atan2(point.y,R-abs(point.x));
    if(point.y<0)
        theta=theta+2*pi;
    end

    fprintf('\n(px,py) = (%4.1f,%4.1f)\tR = %4.1f\tw = %4.1f\tdeg = %4.1f\ta=%4.1f',points(1,ii),points(2,ii),R,omega,theta*180/pi,V^2/R);

    if(point.x < 0)
        direction = -1;
    else
        direction =  1;
    end

    acc = V^2/R;
    time_to_sim = theta/omega;
    for t = Ts:Ts:(time_to_sim+Ts)
        a = direction*omega*t+initial_heading;%+trajectory.yaw(end)*pi/180;
        trajectory.yaw(end+1) = mod(180/pi*a,360);
        vel = V*[sin(a),cos(a)]';
        trajectory.t(end+1) = trajectory.t(end)+Ts;
        trajectory.xd(end+1) = vel(1);
        trajectory.yd(end+1) = vel(2);
        pos = vel*Ts+[trajectory.x(end),trajectory.y(end)]';%yaw_p_rot(initial_heading)*([direction*R,0]'+R*[direction*-cos(a),sin(a)]')+origin;%;;
        trajectory.x(end+1) = pos(1);
        trajectory.y(end+1) = pos(2);

    end
end

fprintf('\n\n\n');