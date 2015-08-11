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
