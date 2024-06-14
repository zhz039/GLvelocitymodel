function smoothed_img = pgm_smoothing(input_img, beta, num_iterations)
    % Convert image to double precision for processing
    img = double(input_img);
    intial_beta = beta;
    S = zeros(20);
    % Pad the image to handle boundaries
    img_padded = padarray(img, [1 1], 'replicate');
    
    % Initialize the smoothed image
    smoothed_img = img_padded;
    
    % Dimensions of the padded image
    [m, n] = size(img_padded);
    
    % Iterative Conditional Modes (ICM) to minimize the energy function
    for iter = 1:num_iterations
        for i = 2:m-1
            for j = 2:n-1
                % Extract the local neighborhood
                local_window = smoothed_img(i-1:i+1, j-1:j+1);
                
                % Current pixel value
                current_pixel = smoothed_img(i, j);
                
                % Compute the sum of squared differences with neighbors
                ssd = sum((local_window(:) - current_pixel).^2);
                
                % Calculate new pixel value minimizing local energy
                % (local mean weighted by beta and the original pixel value)
                local_mean = mean(local_window(:));
                if iter > 1000
                    beta = intial_beta / (floor(iter/1000));
                end
                smoothed_img(i, j) = (ssd * beta * local_mean + current_pixel) / (1 + ssd * beta);
                A=rand(size(S));[~,S,~] = svd(A);
            end
        end
    end
    
    % Remove padding
    smoothed_img = smoothed_img(2:end-1, 2:end-1);
end
