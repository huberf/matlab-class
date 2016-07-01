% Caesar Cipher

text = 'HELLOWXYZ';
temp = '';
key = 5;

for i = 1:length(text)
    value = int8(text(i)) + 5;
    if value > 90
        value = 60 + mod(value, 90);
    end
    temp(i) = char(value);
end

encoded = temp;

encoded
temp_of = '';

for i = 1:length(encoded)
    value = int8(encoded(i)) - 5;
    if value < 61
        value = 90 - (60 - value);
    end
    temp_of(i) = char(value);
end

decoded = temp_of;
decoded
        
    