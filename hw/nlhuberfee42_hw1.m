% ENGR1120 021 Tennessee Tech
% Noah Huber-Feely 6/13/2016
% HW 1 - Hill Cipher

clear variables;
clc;
close all;

% The value you want to calculate
% plaintext = 'MRHILL';
plaintext = input('Enter your value to be encrypted: ', 's');

% The encryption key
encoder = [3, 3
           2, 5];

% Prep var for encrypted value
encryption = '';

% Determine if message is odd
lengthOfPlain = length(plaintext);
if(mod(lengthOfPlain, 2) == 0)
    plaintext = plaintext + ' ';
end

% Convert the plaint text to a 2 x 7 matrix
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

% Encrypting value
encryption = encoder * intermediate;
encryptionArray = encoder * intermediate;

% Convert the encrypted array into values from 0 to 25
index = 1;
for i = encryption
    modResult = mod(i, 26);
    encryption(1, index) = modResult(1);
    encryption(2, index) = modResult(2);
    index = index + 1;
end

% Print encrypted value
fprintf('Encrypted value: ');
for i = encryption
    fprintf(char(i(1)+65));
    fprintf(char(i(2)+65));
end

fprintf('\n');

% Decryption side

% Take the encrypted value and assign it to new variable for clarity
cipher = encryptionArray;

% Rename the encryption key for clarity
key = encoder;

% Find determinant of the key
determinant = (key(1, 1) * key(2, 2)) - (key(1, 2)*key(2,1));

% Further calculate inverse of key
temp = key(1, 1);
key(1, 1) = key(2, 2);
key(2, 2) = temp;
key(1, 2) = -key(1, 2);
key(2, 1) = -key(2, 1);

% Finish inverse key calculation
inversekey = (1/determinant) * key;

% Unencrypt value
unencrypted = inversekey * cipher;

% Asign unencryption to better named variable
plaintext = unencrypted;`

% Print unencrypted value
fprintf('Unencrypted value: ');
for i = plaintext
    fprintf(char(i(1)+65));
    fprintf(char(i(2)+65));
end
fprintf('\n');