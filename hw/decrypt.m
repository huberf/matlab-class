function decrypt = decrypt(string)
    
    ciphertext = string;
    
    encoder = [2, 3
               1, 4];
    
    lengthOfCipher = length(ciphertext);
    if(mod(lengthOfCipher, 2) == 0)
        ciphertext = ciphertext + ' ';
    end

    intermediate = [];
    index = 1;
    tick = 0;
    for i = ciphertext
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
    
    cipher = intermediate;

    key = encoder;

    determinant = mod((key(1, 1) * key(2, 2)) - (key(1, 2)*key(2,1)), 26);

    temp = key(1, 1);
    key(1, 1) = key(2, 2);
    key(2, 2) = temp;
    key(1, 2) = -key(1, 2);
    key(2, 1) = -key(2, 1);
    
    key = mod(key, 26);
    
    key
    
    determinant

    inversekey = mod(determinant * key, 26);
    
    cipher
    
    unencrypted = inversekey * cipher;
    
    unencrypted = inv(key) * cipher;

    plaintext = unencrypted;
    plaintext
    plaintext = mod(plaintext, 26);
    plaintext


    for i = plaintext
        fprintf(char(i(1)+65));
        fprintf(char(i(2)+65));
    end
    fprintf('\n');
end
