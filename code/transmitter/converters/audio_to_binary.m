function binary_data = audio_to_binary(audio)

% Convert float audio (-1 to 1) → 16-bit integer
audio_int = int16(audio * 32767);

% Convert integers to binary
binary_matrix = de2bi(typecast(audio_int,'uint16'),16,'left-msb');

% Convert matrix → single vector
binary_data = reshape(binary_matrix.',1,[]);

end