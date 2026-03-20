function tx_signal = transmit_frames(frames)

% Convert frames to bitstream
bitstream = [];

for i = 1:length(frames)
    bitstream = [bitstream frames{i}];
end

bitstream = double(bitstream);

disp("---- BITSTREAM ----")
disp(bitstream(1:20))   % first 20 bits

% BPSK Mapping
bits_I = 2*(bitstream - 0.5);

disp("---- BPSK MAPPED ----")
disp(bits_I(1:20))   % should be ±1

% Upsampling
sps = 4;
sig_ipt_I = upsample(bits_I,sps);

disp("---- UPSAMPLED ----")
disp(sig_ipt_I(1:20))  % zeros inserted

% Rectangular Pulse Shaping
rect_filter = ones(sps,1);
sig_ract = conv(rect_filter , sig_ipt_I);

disp("---- AFTER FILTER ----")
disp(sig_ract(1:20))  % repeated values

% Normalize
tx_signal = sig_ract / sqrt(var(sig_ract));
tx_signal = tx_signal(:);
tx_signal = tx_signal / max(abs(tx_signal));

disp("---- FINAL TX SIGNAL ----")
disp(tx_signal(1:20))  % should be between -1 and 1

% Save
csvwrite('tx_bits_ref.csv',bitstream');
csvwrite('tx_signal_rect.csv',tx_signal);

disp("Transmission signal generated")

end