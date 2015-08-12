# Jonathan Monreal

# This file contains some scripts for converting binary, octal, decimal, and
# hexadecimal numbers and demonstrating the steps behind these conversions.

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
