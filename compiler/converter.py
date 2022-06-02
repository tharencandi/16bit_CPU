import sys
import binascii

RAM_OUTPUT = """DEPTH = 65536;
WIDTH = 16;
ADDRESS_RADIX = HEX;
DATA_RADIX = BIN;
CONTENT
BEGIN
"""

class err_codes:
    PREFIX_ERR = 0
    BIT_LEN_ERR = 1
    HEX_LEN_ERR = 2
    BIN_ERR = 3
    HEX_ERR = 4
    SUB_ERR = 5
    INSTR_ERR = 6
    def raise_error(err_code, line_number):
        if err_code == err_codes.PREFIX_ERR:
            print("error on line {}. Numbers have to be prefixed with b or h (binary or hex).".format(line_number))
        elif err_code == err_codes.BIT_LEN_ERR:
            print("error on line {}. binary number must be 8 bits.".format(line_number))
        elif err_code == err_codes.HEX_LEN_ERR:
            print("error on line {}. hex number must be 2 characters.".format(line_number))
        elif err_code == err_codes.BIN_ERR:
            print("error on line {}. Not a binary number.".format(line_number))
        elif err_code == err_codes.HEX_ERR:
           print("error on line {}. Not a hex number.".format(line_number))
        elif err_code == err_codes.SUB_ERR:
            print("error on line {}. Subroutine does not exist.".format(line_number))
        elif err_code == err_codes.INSTR_ERR:
            print("error on line {}. instruction does not exist.".format(line_number))
        else:
            print("error on line {}.".format(line_number))
        exit(0)

instructions = {
    "load": "0000", "mov": "0001" ,"add": "0010", 
    "sub": "0011", "xor": "0100", "ldpc": "0101", 
    "branch": "0110", "mul": "0111", "push": "1000", 
    "pop": "1001", "call": "1010", "ret": "1011",
    "cp":"1100", "breq": "1101", "brlo":"1110",
    "brhi":"1111"
    }

registers = {
    "r0": "0000", "r1": "0001",
    "r2":"0010", "r3":"0011", 
    "r4":"0100", "r5": "0101", 
    "r6":"0110", "r7":"0111",
    "r8": "1000", "r9": "1001",
    "r10": "1010", "r11": "1011",
    "r12": "1100", "r13": "1101",
    "r14": "1110", "r15": "1111",

    "rxl": "1000", "rxr": "1001", "rx":"1000",
    "ryl": "1010", "ryr": "1011", "ry":"1010",
    "rzl": "1100", "rzr": "1101", "rz":"1100",

    "sr": "1110","sp": "1111"
    }

if len(sys.argv) < 2:
    print("missing command line arg: filename")
    exit(0)


f = open(sys.argv[1], "r")
text = f.readlines()

#find subroutines and compute address

i = 0
subroutines = {}
parsed_text = []
for line in text:
    line = line.strip().lower()
    line = line.split("//", 1)[0]
    if len(line) == 0:
        continue
    if ":" in line:
        sub = line.split(":",1)[0]
        #sub = line[:-1]
        subroutines[sub] = i
    elif ("call" in line) or ("breq" in line) or ("brlo" in line) or ("brhi" in line):
        i += 2
        parsed_text.append(line.split())
    else:
        i += 1
        parsed_text.append(line.split())  
        
def int_to_binstr(i, bin_len):
    bin_number = bin(i)[2:]
    padded_binary = bin_number.zfill(bin_len)
    return padded_binary

def encode_reg(register_str, i):
    if register_str not in registers:
        err_codes.raise_error(-1, i)
    return registers[register_str]

def encode_number(number, i, num_bits):
   
    value = "" 
    prefix = number[0]    
    if prefix != "b" and prefix != "h":
            err_codes.raise_error(err_codes.PREFIX_ERR, i)
    
    if prefix == "b":
        bin_str = number[1:]
        for digit in bin_str:
            if digit != "0" and digit != "1":
                err_codes.raise_error(err_codes.BIN_ERR, i)
        
        if len(bin_str) != num_bits:
            err_codes.raise_error(err_codes.BIT_LEN_ERR, i)
        value = bin_str
    else:
        hex_str = number[1:]
        if len(hex_str) != 2:
            err_codes.raise_error(err_codes.HEX_LEN_ERR, i)
        
        hex_as_int = int(hex_str, 16)
        value = int_to_binstr(hex_as_int, num_bits)
    
    return value

encoded_instrs = []
i = 1 
for line in parsed_text:
    instr = line[0]
    op_code = instructions[instr]
    #instr rx, D(8b)
    if instr == "load":
        if len(line) < 3:
            err_codes.raise_error(-1, i)
        rx = encode_reg(line[1],i)
        bin_num_str = encode_number(line[2], i, 8)
        encoded_instrs.append((f"{op_code}{rx}{bin_num_str}", i))
     
    #instr rx, ry
    elif instr in ["mov", "add", "sub", "xor", "mul", "cp"]:
        if len(line) < 3:
            err_codes.raise_error(-1, i)
        rx = encode_reg(line[1],i)
        ry = encode_reg(line[2],i)

        encoded_instrs.append((f"{op_code}{rx}{ry}0000",i))
    #instr rx
    elif instr in ["ldpc", "branch", "push", "pop"]:
        if len(line) < 2:
            err_codes.raise_error(-1, i)
        rx = encode_reg(line[1],i)

        encoded_instrs.append((f"{op_code}{rx}00000000",i))
    #instr, D(16b)
    elif instr in ["call", "breq", "brlo", "brhi"]:
        if len(line) < 2:
            err_codes.raise_error(-1, i)
   
        if line[1] not in subroutines:
            err_codes.raise_error(err_codes.SUB_ERR, i)

        encoded_instrs.append((f"{op_code}000000000000",i))
        address = int_to_binstr(subroutines[line[1]], 16)
    
        encoded_instrs.append((f"{address}",i))
    #instr
    elif instr in ["ret"]:
        encoded_instrs.append((f"{op_code}000000000000",i))
    else:
        err_codes.raise_error(err_codes.INSTR_ERR, i)


    i += 1



addr = 0
for line in encoded_instrs:
    binary = line[0]
    asm_line_num = line[1] -1
    asm = " ".join(parsed_text[asm_line_num])

    hex_addr = hex(addr).split("x",1)[1].zfill(2)
    RAM_OUTPUT += f"{hex_addr}: {binary}; -- {asm}\n"
    addr += 1
RAM_OUTPUT += "END;"



print(RAM_OUTPUT)
    
