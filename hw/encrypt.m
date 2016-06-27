function encrpt = encrypt(string)
    plaintext = string;
    encryption = '';

    lengthOfPlain = length(plaintext);
    if(mod(lengthOfPlain, 2) == 0)
        plaintext = plaintext + ' ';
    end

    intermediate = [];
    index = 1;
    tick = 0;
    for i = plaintext
        toReturn = '';
        value = double(i);
        if value > 96
            toReturn = value - 97;
        end
        if value < 91
            toReturn = value - 65;
        end
        if i == ' '
            toReturn = -1;
        end
        if tick == 0
            intermediate(1, index) = toReturn;
            tick = 1;
        elseif tick == 1
            intermediate(2, index) = toReturn;
            index = index + 1;
            tick = 0;
        end
    end

    encoder = [2, 3
               1, 4];

    intermediate

    encryption = encoder * intermediate;
    encryptionArray = encoder * intermediate;

    index = 1;
    for i = encryption
        modResult = mod(i, 26);
        encryption(1, index) = modResult(1);
        encryption(2, index) = modResult(2);
        index = index + 1;
    end

    encryption
    
    encryption


    for i = encryption
        fprintf(char(i(1)+65));
        fprintf(char(i(2)+65));
    end

    fprintf('\n');
end