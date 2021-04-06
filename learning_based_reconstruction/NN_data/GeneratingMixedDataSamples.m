% Using EIDORS to simulate 2D data 

% Step 1: Create simple 16 electrode 2D model
n_elec= 16;
n_rings= 1;
options = {'no_meas_current','no_rotate_meas'};
imdl = mk_common_model('c2C',16);             % pre-built model
bkgnd = 1;
img_1 = mk_image(imdl.fwd_model,bkgnd);       % Homogeneous Impedance Distribution (output)
show_fem(img_1);
homg_data=fwd_solve(img_1);                   % Boundary voltage (input)

% Step 2: Simulating tumor(single/double) and no tumor              
A = [];        
V = [];

% No tumor
for j = 1:1:1
    for i = 0.88:0.005:1.2
        bkgnd = i;
        img_1 = mk_image(imdl.fwd_model,bkgnd);  
        img_2 = img_1;
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% Tumor
bkgnd = 1;                                    % Reset background value to 1
img_1 = mk_image(imdl.fwd_model,bkgnd);       % Homogeneous Impedance Distribution (output)
for j = 1:1:10
    for i = 0.2:0.01:0.25
         % Introduce a single inhomogeneity in tissue
        img_2 = img_1;
        select_fcn1 = @(x,y,z) (x-rand).^2+(y-rand).^2<i^2;   % tumor 1
        img_2.elem_data = bkgnd + elem_select(img_2.fwd_model, select_fcn1);
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% No tumor
for j = 1:1:1
    for i = 0.7:0.005:0.8
        bkgnd = i;
        img_1 = mk_image(imdl.fwd_model,bkgnd);  
        img_2 = img_1;
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% No tumor
for j = 1:1:1
    for i = 0.6:0.005:0.7
        bkgnd = i;
        img_1 = mk_image(imdl.fwd_model,bkgnd);  
        img_2 = img_1;
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% Tumor
bkgnd = 1;
img_1 = mk_image(imdl.fwd_model,bkgnd);
for j = 1:1:15
    for i = 0.2:0.02:0.25
        img_2 = img_1;
        % % Introduce a two inhomogeneities in tissue
        select_fcn1 = @(x,y,z) (x-rand).^2+(y-rand).^2<i^2;   % tumor 1
        select_fcn2 = @(x,y,z) (x-rand).^2+(y+rand).^2<i^2;   % tumor 2
        img_2.elem_data = bkgnd + elem_select(img_2.fwd_model, select_fcn1);
        img_2.elem_data = img_2.elem_data + elem_select(img_2.fwd_model, select_fcn2);
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% No tumor
for j = 1:1:1
    for i = 0.42:0.005:0.58
        bkgnd = i;
        img_1 = mk_image(imdl.fwd_model,bkgnd);  
        img_2 = img_1;
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% Tumor
bkgnd = 1;
img_1 = mk_image(imdl.fwd_model,bkgnd);
for j = 1:1:15
    for i = 0.1:0.02:0.15
        img_2 = img_1;
         % Introduce a single inhomogeneity in tissue
        select_fcn1 = @(x,y,z) (x-rand).^2+(y-rand).^2<i^2;   % tumor 1
        img_2.elem_data = bkgnd + elem_select(img_2.fwd_model, select_fcn1);
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% No tumor
for j = 1:1:1
    for i = 0.45:0.005:0.65
        bkgnd = i;
        img_1 = mk_image(imdl.fwd_model,bkgnd);  
        img_2 = img_1;
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% Tumor
bkgnd = 1;
img_1 = mk_image(imdl.fwd_model,bkgnd);
for j = 1:1:11
    for i = 0.1:0.02:0.22
        img_2 = img_1;
        % Introduce a two inhomogeneities in tissue
        select_fcn1 = @(x,y,z) (x-rand).^2+(y-rand).^2<i^2;   % tumor 1
        select_fcn2 = @(x,y,z) (x-rand).^2+(y+rand).^2<i^2;   % tumor 2
        img_2.elem_data = bkgnd + elem_select(img_2.fwd_model, select_fcn1);
        img_2.elem_data = img_2.elem_data + elem_select(img_2.fwd_model, select_fcn2);
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% No tumor
for j = 1:1:1
    for i = 0.8:0.005:0.92
        bkgnd = i;
        img_1 = mk_image(imdl.fwd_model,bkgnd);  
        img_2 = img_1;
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% No tumor
for j = 1:1:1
    for i = 0.4:0.01:0.5
        bkgnd = i;
        img_1 = mk_image(imdl.fwd_model,bkgnd);  
        img_2 = img_1;
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

% Tumor
bkgnd = 1;
img_1 = mk_image(imdl.fwd_model,bkgnd);
for j = 1:1:10
    for i = 0.25:0.01:0.3
        img_2 = img_1;
        % Introduce a two inhomogeneities in tissue
        select_fcn1 = @(x,y,z) (x-rand).^2+(y-rand).^2<i^2;   % tumor 1
        select_fcn2 = @(x,y,z) (x-rand).^2+(y+rand).^2<i^2;   % tumor 2
        img_2.elem_data = bkgnd + elem_select(img_2.fwd_model, select_fcn1);
        img_2.elem_data = img_2.elem_data + elem_select(img_2.fwd_model, select_fcn2);
        %show_fem(img_2);  
        inh_data=fwd_solve(img_2);

        A = [A; img_2.elem_data'];                     % Append new impedance data to matrix
        V = [V; inh_data.meas'];                       % Append voltage data to matrix
    end
end

writematrix(A,'new_output_test.csv');
writematrix(V,'new_input_test.csv');
