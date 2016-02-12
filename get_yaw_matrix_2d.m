function [y_mat] = get_yaw_matrix_2d(yaw)
    %yaw is a counterclockwise rotation of y about the z-axis
    temp = get_yaw_matrix(yaw);
    y_mat = temp(1:2,1:2);
end