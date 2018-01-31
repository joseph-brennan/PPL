"""
Joey Brennan
Project 1 Mal Syntax Checking
"""


class MalChecking:
    def __init__(self, file_name):
        self.file_name = file_name

        self.mal_file = open(file_name, 'r')

        self.log = open(file_name + ".log", 'w')

        self.instruction = {1: "BR", 2: "BGT", 3: "BLT", 4: "BEQ", 5: "DIV", 6: "MUL",
                            7: "DEC", 8: "SUB", 9: "INC", 10: "ADD", 11: "MOVEI", 12: "MOVE"}

        # each key corresponds to the line where the error takes place
        self.errors = {}

        # current list of errors on the line
        self.list = []

        # the full line of code
        self.print_line = {}

        # tracks the line numbers
        self.count = 0

    def read_file(self):
        for l in self.mal_file:
            self.count += 1

            # blank line move forward
            if l.__len__() is 0:
                continue

            # skip the comments
            elif l[0] is ';':
                continue

            else:
                self.print_line[self.count] = l
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

        self.errors[self.count] = self.list

        self.list.clear()

    def bad_label(self, line):
        label = ""
        for i in line:
            if i is ':':
                # do check this is a label
                if len(label) > 5:
                    # launch error code printer
                    self.list = "** error: label violates memory rule"
                    return

                else:
                    self.list = "null"
                    return

            # it is an instruction
            elif i is " ":
                return

            # not yet the complete string
            else:
                label += i

    def invalid_opcode(self, line):
        instruction = ""
        for letter in line:
            if letter is " ":
                for i in self.instruction.keys():
                    # valid
                    if self.instruction.get(i) is instruction:
                        self.list = "null"
                        return

                    # not matching
                    else:
                        continue

                # did not match
                self.list = "** error: invalid opcode"

            # label comes first (known to be checked)
            elif letter is ":":
                pass

            else:
                instruction += letter

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
