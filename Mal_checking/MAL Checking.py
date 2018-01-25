"""
Joey Brennan
Project 1 Mal Syntax Checking
"""


class MalChecking:
    def __init__(self, file_name):
        self.file_name = file_name

        self.mal_file = open(file_name, 'r')

        self.log = open("log_file.txt", 'w')

    def read_file(self):
        for l in self.mal_file:

            # blank line move forward
            if l.__len__() is 0:
                continue

            # skip the comments
            elif l[0] is ';':
                continue

            else:
                self.error_checking(l)

        self.mal_file.close()

        self.file_end()

    def error_checking(self, line):
        self.bad_label(line)

        self.invalid_opcode(line)

        self.bad_low_operands(line)

        self.bad_high_operands(line)

        self.bad_type(line)

        self.warning_label(line)

    def bad_label(self, line):
        for i in line:
            if i is ':':
                pass
                # do check this is a label
            else:
                continue

    def invalid_opcode(self, line):
        while True:
            word = ""
            for letter in line:
                word += letter

                if word is "MOVEI":
                    pass
                elif word is "MOVE":
                    pass
                elif word is "ADD":
                    pass
                elif word is "INC":
                    pass
                elif word is "SUB":
                    pass
                elif word is "DEC":
                    pass
                elif word is "MUL":
                    pass
                elif word is "DIV":
                    pass
                elif word is "BEQ":
                    pass
                elif word is "BLT":
                    pass
                elif word is "BGT":
                    pass
                elif word is "BR":
                    pass
                else:
                    pass

    def bad_high_operands(self, line):
        pass

    def bad_low_operands(self, line):
        pass

    def wrong_operands(self, line):
        pass

    def bad_type(self, line):
        pass

    def warning_label(self, line):
        pass

    def file_end(self):
        self.log.close()


if __name__ == '__main__':
    file_name = "mal_test"  # input("what is the name of the mal file?")
    file_name += '.mal'
    mal = MalChecking(file_name)
