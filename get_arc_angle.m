function [arc_angle,direction] = get_arc_angle(R,px,py)
    %Given a circle on either side of the origin with a radius R
    % with a center at +/- (R,0), depending on a left or right turn.
    % this function will return the angle arc you will need to travel
    % on that circle so that it is a straight line from the end point
    % on the arc to the given point (px,py)
    % a point has two tangent lines that point to it
    % the first one is alpha_p (positive) the other is alpha_m
    % the first arc point corresponds to you driving forward
    % the second arc point corresponds to the later point where you are
    % heading in the complete opposite direction.
    px2 = abs(px);
    if(sqrt((px2-R).^2+(py).^2)<R || (px==0 && py==0))
        %impossible to travel to this point
        % it is 
        arc_angle = 0;
        direction = 'invalid';
        return;
    end

    if(px==0 && py>0)
        %does not need to travel on an arc
        arc_angle = 0;
        direction = 'straight';
        return;
    elseif(px>=0)
        direction = 'right';
    else
        direction = 'left';
    end

    %note px2
    theta1 = acos((R)./(sqrt((px2-R).^2+(py).^2)));
    theta2 = atan2(py,px2-R);
    alpha_p = theta1+theta2;
    %alpha_m = theta1-theta2;

    arc_angle = pi-alpha_p; 
    arc_angle = arc_angle*180/pi;   
end