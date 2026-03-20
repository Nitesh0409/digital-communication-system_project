function frames = frame_builder(data, payload_size, data_type)

% -----------------------------
% Validate binary input
% -----------------------------
if ~all(data==0 | data==1)
    error('Input data must be binary')
end

% -----------------------------
% Define frame parameters
% -----------------------------
preamble = repmat([1 0],1,8);   % 16-bit preamble
type_bits = de2bi(data_type,2,'left-msb');

data_len = length(data);

% total frames required
total_frames = ceil(data_len / payload_size);

% store frames
frames = cell(1,total_frames);

% -----------------------------
% Frame generation loop
% -----------------------------
for i = 1:total_frames

    % payload extraction
    start_idx = (i-1)*payload_size + 1;
    end_idx = min(i*payload_size,data_len);
    
    payload = data(start_idx:end_idx);

    % payload length
    length_bits = de2bi(length(payload),16,'left-msb');

    % frame sequence number
    seq_bits = de2bi(i,32,'left-msb');

    % total frames
    total_bits = de2bi(total_frames,32,'left-msb');

    % -----------------------------
    % FLAGS logic
    % -----------------------------
    if total_frames == 1
        flag = 3;        % single frame
    elseif i == 1
        flag = 0;        % start
    elseif i == total_frames
        flag = 2;        % end
    else
        flag = 1;        % middle
    end

    flag_bits = de2bi(flag,2,'left-msb');

    % -----------------------------
    % Header creation
    % -----------------------------
    header = [preamble type_bits flag_bits length_bits seq_bits total_bits];

    % -----------------------------
    % CRC generation
    % -----------------------------
    crc = compute_crc([header payload]);

    % -----------------------------
    % Final frame
    % -----------------------------
    frame = [header payload crc];

    frames{i} = frame;

end

end


% ------------------------------------
% CRC calculation function
% ------------------------------------
function crc = compute_crc(data)

value = mod(sum(data),256);

crc = de2bi(value,8,'left-msb');

end