% Example of using EIDORS to simulate 2D data and to
% solve it using various 2D solvers
% Step 1: Create simple 16 electrode 2D model
% 
n_elec= 16;
n_rings= 1;
options = {'no_meas_current','no_rotate_meas'};
imdl = mk_common_model('c2C',16);             % pre-built model
bkgnd = 1;
img_1 = mk_image(imdl.fwd_model,bkgnd);       % Homogeneous Impedance Distribution (output)
show_fem(img_1);
homg_data=fwd_solve(img_1);                   % Boundary voltage (input)

% Simulating a tumor
img_2 = img_1;                                % Introduce inhomogeneity in tissue

% each function is a tumor location
A = [];        
V = [];

for j = 1:1:25
    for i = 0.1:0.01:0.3
        img_2 = img_1;
        select_fcn1 = @(x,y,z) (x-rand).^2+(y-rand).^2<i^2;   % tumor 1
        img_2.elem_data = bkgnd + elem_select(img_2.fwd_model, select_fcn1);
        show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

for j = 1:1:25
    for i = 0.1:0.01:0.3
        img_2 = img_1;
        select_fcn1 = @(x,y,z) (x-rand).^2+(y-rand).^2<i^2;   % tumor 1
        select_fcn2 = @(x,y,z) (x-rand).^2+(y+rand).^2<i^2;   % tumor 2
        img_2.elem_data = bkgnd + elem_select(img_2.fwd_model, select_fcn1);
        img_2.elem_data = img_2.elem_data + elem_select(img_2.fwd_model, select_fcn2);
        show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

writematrix(A,'train_I_output.csv');
writematrix(V,'train_V_input.csv');
