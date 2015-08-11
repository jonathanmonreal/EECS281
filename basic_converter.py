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
