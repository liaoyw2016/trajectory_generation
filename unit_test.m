
%% get_yaw_matrix_2d

one_bit_error = @(testValue,comparisonValue) abs(testValue - comparisonValue) <= eps(comparisonValue);
trig_close_enough = @(x) abs(x)<eps(1);

yaw   = 0;
y_mat = [ 1, 0; ...
          0, 1];
assert(trig_close_enough(y_mat-get_yaw_matrix_2d(yaw)));
yaw   = pi/2;
y_mat = [ 0,-1; ...
          1, 0];
assert(trig_close_enough(y_mat-get_yaw_matrix_2d(yaw)));
yaw   = pi;
y_mat = [-1, 0; ...
          0,-1];
assert(trig_close_enough(y_mat-get_yaw_matrix_2d(yaw)));
yaw   = 3*pi/2;
y_mat = [ 0, 1; ...
         -1, 0];
assert(trig_close_enough(y_mat-get_yaw_matrix_2d(yaw)));
yaw = pi/4;
y_mat = 1/sqrt(2)*[ 1,-1;...
                    1, 1];
assert(trig_close_enough(y_mat-get_yaw_matrix_2d(yaw)));

%% get_yaw_matrix
add_z_dim = @(A) [A,zeros(2,1);0,0,1];
yaw   = 0;
y_mat = [ 1, 0; ...
          0, 1];
assert(trig_close_enough(add_z_dim(y_mat)-get_yaw_matrix(yaw)));
yaw   = pi/2;
y_mat = [ 0,-1; ...
          1, 0];
assert(trig_close_enough(add_z_dim(y_mat)-get_yaw_matrix(yaw)));
yaw   = pi;
y_mat = [-1, 0; ...
          0,-1];
assert(trig_close_enough(add_z_dim(y_mat)-get_yaw_matrix(yaw)));
yaw   = 3*pi/2;
y_mat = [ 0, 1; ...
         -1, 0];
assert(trig_close_enough(add_z_dim(y_mat)-get_yaw_matrix(yaw)));
yaw = pi/4;
y_mat = 1/sqrt(2)*[ 1,-1;...
                    1, 1];
assert(trig_close_enough(add_z_dim(y_mat)-get_yaw_matrix(yaw)));
