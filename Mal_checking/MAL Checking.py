"""
Joey Brennan
Project 1 Mal Syntax Checking
"""
import time


class MalChecking:
    def __init__(self, file_name):
        self.file_name = file_name

        self.mal_file = open(file_name + ".mal", 'r')

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
                line = l.partition(";")

                self.print_line[self.count] = line[0]

                self.error_checking(line[0])

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
        label = line.partition(":")

        if label[1] is ':':
            if len(label[0]) > 5:
                self.list.append("** error: memory identifier must be 5 or less")
                return

            # valid label
            else:
                return

        # is not a label
        else:
            return

    def invalid_opcode(self, line):
        instruction = line.partition(":")

        if instruction[1] is ":":
            opcode = instruction[2].partition(" ")

            for i in self.instruction.keys():
                # valid opcode
                if opcode is self.instruction.get(i):
                    return

            self.list.append("** error: invalid opcode")
            return

        else:
            opcode = instruction[0].partition(" ")

            for i in self.instruction.keys():
                # valid opcode
                if opcode is self.instruction.get(i):
                    return

            self.list.append("** error: invalid opcode")
            return

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

    def file_end(self,):
        self.log.write("log file for " + self.file_name + ".mal " +
                       " named " + self.file_name + ".log " + time.ctime + " By Joey Brennan" )
        self.log.close()


if __name__ == '__main__':
    file_name = "mal_test"  # input("what is the name of the mal file?")
    mal = MalChecking(file_name)
