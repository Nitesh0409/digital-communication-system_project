function [binary_data,type] = load_file(filepath)

[~,~,ext] = fileparts(filepath);

switch lower(ext)

    case '.mpeg'

        [audio,Fs] = audioread(filepath);
        audio = mean(audio,2);

        binary_data = audio_to_binary(audio);
        type = 1;

    case '.jpeg'

        img = imread(filepath);

        binary_data = image_to_binary(img);
        type = 2;

    case '.txt'

        txt = fileread(filepath);

        binary_data = text_to_binary(txt);
        type = 0;

    otherwise
        error('Unsupported file type')

end

end
