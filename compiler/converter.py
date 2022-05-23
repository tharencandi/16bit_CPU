import sys
import binascii

RAM_OUTPUT = """DEPTH = 65536;
WIDTH = 16;
ADDRESS_RADIX = HEX;
DATA_RADIX = BIN;
CONTENT
BEGIN
"""


instructions = {
    "load": "0000", "mov": "0001" ,"add": "0010", 
    "sub": "0011", "xor": "0100", "ldpc": "0101", 
    "branch": "0110", "mul": "0111", "push": "1000", 
    "pop": "1001", "call": "1010", "ret": "1011"
    }

registers = {
    "r0": "0000", "r1": "0001",
    "r2":"0010", "r3":"0011", 
    "r4":"0100", "r5": "0101", 
    "r6":"0110", "r7":"0111"
    }

if len(sys.argv) < 2:
    print("missing command line arg: filename")
    exit(0)

i = 0 
f = open(sys.argv[1], "r")
text = f.readlines()
machine_instructions = []
for line in text:
    stri = ""
    line_str = line.strip().lower()
    line = line_str.split(" ")
    if len(line) < 2:
        continue
    instr = line[0]
    rx = line[1]
    stri += instructions[instr] 
    stri += registers[rx] 
    if len(line) > 2:
        if instr == "load":
            if line[2][0] != "b" and line[2][0] != "h":
                print("error on line {}. Numbers have to be prefixed with b or h (binary or hex)".format(i + 1))
                exit(0)
            if "b" in line[2]:
                bin_str = line[2][1:]
                for digit in bin_str:
                    if digit != "0" and digit != "1":
                        print("error on line {}. Not a binary number".format(i + 1))
                        exit(0)
                if len(bin_str) != 8:
                    print("error on line {}. binary number must be 8 bits".format(i + 1))
                    exit(0)
                stri += bin_str
            else:
                hex_str = line[2][1:]
                if len(hex_str) != 2:
                    print("error on line {}. hex number must be 2 characters".format(i + 1))
                    exit(0)
                hex_as_int = int(hex_str, 16)
                hex_as_binary = bin(hex_as_int)
                padded_binary = hex_as_binary[2:].zfill(8)
                stri += padded_binary
        else:
            ry = line[2] 
            stri += registers[ry] + "0000"
    else:
        stri += "00000000"
    machine_instructions.append(stri)
    
    h = ("0x%0.2X" % i)[2:]
    RAM_OUTPUT += h + ": " + machine_instructions[i] + "; -- " + line_str + "\n"
    i += 1



RAM_OUTPUT += "END;"
print(RAM_OUTPUT)
    
