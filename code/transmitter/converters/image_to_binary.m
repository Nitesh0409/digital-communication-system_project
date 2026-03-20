function binary_data = image_to_binary(img)


% Convert to grayscale
img = rgb2gray(img);

% Reduce image size
img = imresize(img,[32 32]);

% Convert image pixels to uint8
img_uint8 = uint8(img);

% Convert pixels to binary
binary_matrix = de2bi(img_uint8(:),8,'left-msb');

% Convert matrix to single bit stream
binary_data = reshape(binary_matrix.',1,[]);

end