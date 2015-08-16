# Jonathan Monreal

# This file contains some scripts for converting binary, octal, decimal, and
# hexadecimal numbers and demonstrating the steps behind these conversions.

# Binary to other:

def bin_to_oct(n):
    n = list(str(n))
    while(len(n) % 3 != 0):
        n.insert(0, '0')
    s = ''

    for i in range(0, len(n), 3):
        digit = int(bin_to_dec(''.join(n[i:i+3])))
        s += str(digit)
    
    return s

def bin_to_dec(n):
    n = list(str((n)))
    s = ''
    d = 0

    digits = len(n)
    for i in range(1, len(n) + 1):
        b = n.pop(0)
        s = s + ' + ' + str(b) + ' * 2^' + str(int(digits - i))
        d += int(b) * (2 ** (digits - i))
    print s[3:]
    return d

def bin_to_hex(n):
    n = list(str(n))
    while(len(n) % 4 != 0):
        n.insert(0, '0')
    s = ''
    hex_dict = {10:'A', 11:'B', 12:'C', 13:'D', 14:'E', 15:'F'}

    for i in range(0, len(n), 4):
        digit = int(bin_to_dec(''.join(n[i:i+4])))
        if digit > 9:
            print str(digit) + '=' + hex_dict.get(digit)
            digit = hex_dict.get(digit)
        s += str(digit)
    
    return s

# Octal to other:

def oct_to_bin(n):
    n = list(str(n))
    s = ''
    d = 0

    for digit in n:
        bin_digit = dec_to_bin(digit, 1)
        s += bin_digit
        print digit + ' = ' + bin_digit

    return s

def oct_to_dec(n):
    n = list(str((n)))
    s = ''
    d = 0

    digits = len(n)
    for i in range(1, len(n) + 1):
        b = n.pop(0)
        s = s + ' + ' + str(b) + ' * 8^' + str(int(digits - i))
        d += int(b) * (8 ** (digits - i))
    print s[3:]
    return d

def oct_to_hex(n):
    n = oct_to_bin(n)
    return bin_to_hex(n)

# Decimal to other

def dec_to_bin(n, num_bytes = 0):
    n = int(n)
    b = []
    pad1 = len(str(n))
    pad2 = len(str(n / 2))

    while(n > 0):
        print '%*d / 2 = %*dR%d' % (pad1, n, pad2, n // 2, n % 2)
        b.insert(0, str(n % 2))
        n //= 2

    if num_bytes * 4 > len(b):
        for i in range(0, num_bytes * 4 - len(b)):
            b.insert(0, '0')
    
    return ''.join(b)

def dec_to_oct(n):
    n = dec_to_bin(n)
    return bin_to_oct(n)

def dec_to_hex(n):
    n = dec_to_bin(n)
    return bin_to_hex(n)

# Hexidecimal to other:

def hex_to_bin(n):
    n = list(str(n))
    s = ''
    d = 0

    hex_dict = {'A':'10', 'B':'11', 'C':'12', 'D':'13', 'E':'14', 'F':'15'}
    for digit in n:
        bin_digit = ''
        if digit.isalpha():
            bin_digit = dec_to_bin(hex_dict.get(digit), 1)
            s += bin_digit
        else:
            bin_digit = dec_to_bin(digit, 1)
            s += bin_digit
        print digit + ' = ' + bin_digit

    return s

def hex_to_oct(n):
    n = hex_to_bin(n)
    return bin_to_oct(n)

def hex_to_dec(n):
    n = list(str(n))
    s = ''
    d = 0

    hex_dict = {'A':'10', 'B':'11', 'C':'12', 'D':'13', 'E':'14', 'F':'15'}
    for i in range(0, len(n)):
        if n[i] in hex_dict.keys():
            n[i] = hex_dict.get(n[i])

    digits = len(n)
    for i in range(1, len(n) + 1):
        b = n.pop(0)
        s = s + ' + ' + str(b) + ' * 16^' + str(int(digits - i))
        d += int(b) * (16 ** (digits - i))
    print s[3:]
    return d
