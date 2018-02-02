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

        self.register = {1: "R0", 2: "R1", 3: "R2", 4: "R3", 5: "R4", 6: "R5", 7: "R6", 8: "R7"}

        # each key corresponds to the line where the error takes place
        self.errors = {}

        # current list of errors on the line
        self.list = []

        # the full line of code
        self.print_line = {}

        # tracks the line numbers
        self.count = 0

        # list of labels
        self.label = []

        # list of branch locations
        self.branch = {}

    def read_file(self):
        for l in self.mal_file:
            self.count += 1

            # blank line move forward
            if l is '\n':
                continue

            # skip the comments
            if l.startswith(";"):
                continue

            # known end of file
            if l == "END":
                continue

            else:
                line = l.partition(';')

                self.print_line[self.count] = line[0].strip()

                self.error_checking(line[0].strip())

        self.branch_checker()

        self.mal_file.close()

        self.file_end()

    def error_checking(self, line):

        self.bad_label(line)

        self.errors[self.count] = self.list.copy()

        self.list.clear()

    def bad_label(self, line):
        label = line.partition(":")

        if label[1] is ':':
            if len(label[0]) > 5:
                self.list.append("** error: label memory identifier must be 5 or less")

                # error on line now gets every error in line
                self.invalid_opcode(label[2])

            elif label[0].isalpha() is False:
                self.list.append("** error: memory location can only contain letters")

                # error on line now gets every error in line
                self.invalid_opcode(label[2])

            # valid label
            else:
                self.label.append(label[0])

                if label[2] is not '':
                    self.invalid_opcode(label[2])
                    return

        # no label on line
        else:
            self.invalid_opcode(label[0])
            return

    def invalid_opcode(self, line):
        opcode = line.lstrip().partition(" ")

        if opcode[0] in self.instruction.values():
            # valid opcode
            self.bad_operands(line)
            return

        else:
            self.list.append("** error: invalid opcode")
            self.bad_operands(line)
            return

    def bad_operands(self, line):
        opcode = line.lstrip().partition(" ")

        operands = opcode[2].split(",")

        switch = 0

        if opcode[0] in self.instruction.values():
            for key in self.instruction.keys():
                if self.instruction.get(key) == opcode[0]:
                    switch = key

            if switch == 1:
                if len(operands) > 1:
                    self.list.append("** error: can only have one label for BR")

                elif len(operands) < 1:
                    self.list.append("** error: needs one label for BR")

            elif switch == 2:
                if len(operands) > 3:
                    self.list.append("** error: can only have 3 arguments in BLT")

                elif len(operands) < 3:
                    self.list.append("** error: needs 3 arguments for BLT two to compare third label")

            elif switch == 3:
                if len(operands) > 3:
                    self.list.append("** error: can only have 3 arguments in BLT")

                elif len(operands) < 3:
                    self.list.append("** error: needs 3 arguments for BLT, two to compare, third label")

            elif switch == 4:
                if len(operands) > 3:
                    self.list.append("** error: can only have 3 arguments in BEQ")

                elif len(operands) < 3:
                    self.list.append("** error: needs 3 arguments for BEQ, two to compare, third label")

            elif switch == 5:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination DIV")

                elif len(operands) < 3:
                    self.list.append("** error: needs two inputs and a destination for DIV")

            elif switch == 6:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination MUL")

                elif len(operands) < 3:
                    self.list.append("** error: need two inputs and a destination for MUL")

            elif switch == 7:
                if len(operands) > 1:
                    self.list.append("** error: can only have one source location for DEC")

                elif len(operands) < 1:
                    self.list.append("** error: needs one at least one source DEC")

            elif switch == 8:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination SUB")

                elif len(operands) < 3:
                    self.list.append("** error: need two inputs and a destination for SUB")

            elif switch == 9:
                if len(operands) > 1:
                    self.list.append("** error: can only have one source location for INC")

                elif len(operands) < 1:
                    self.list.append("** error: needs one at least one source INC")

            elif switch == 10:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination ADD")

                elif len(operands) < 3:
                    self.list.append("** error: need two inputs and a destination for ADD")

            elif switch == 11:
                if len(operands) > 2:
                    self.list.append("** error: must have one immediate and one destination MOVEI")

                elif len(operands) < 2:
                    self.list.append("** error: needs one immediate and one destination MOVIE")

            elif switch == 12:
                if len(operands) > 2:
                    self.list.append("** error: must have one source and one destination MOVE")

                elif len(operands) < 2:
                    self.list.append("** error: needs one source and one destination MOVE")

        self.wrong_operands(opcode[0], operands)
        return

    def wrong_operands(self, opcode, operand):
        switch = 0

        for key in self.instruction.keys():
            if self.instruction.get(key) == opcode:
                switch = key
        # Move
        if switch == 12:
            try:
                self.source_check(operand[0])

                try:
                    self.destination_check(operand[1])

                except IndexError:
                    self.list.append("** error: no destination")

            except IndexError:
                self.list.append("** error: no source")

        # MoveI
        elif switch == 11:
            try:
                self.immediate_check(operand[0])

                try:
                    self.destination_check(operand[1])

                except IndexError:
                    self.list.append("** error: no destination")

            except IndexError:
                self.list.append("** error: no source")

        # Add or Sub or Mul or Div
        elif switch == 10 or switch == 8 or switch == 6 or switch == 5:
            try:
                self.source_check(operand[0])

                try:

                    self.source_check(operand[1])

                    try:
                        self.destination_check(operand[2])

                    except IndexError:
                        self.list.append("** error: missing destination")

                except IndexError:
                    self.list.append("** error: second source missing")

            except IndexError:
                self.list.append("** error: first source missing")

        # Inc or Dec
        elif switch == 9 or switch == 7:
            try:
                self.source_check(operand[0])

            except IndexError:
                self.list.append("** error: missing source")

        # Beq or Blt or Bgt
        elif switch == 4 or switch == 3 or switch == 2:
            try:
                self.source_check(operand[0])

                try:
                    self.source_check(operand[1])

                    try:
                        self.label_check(operand[2])

                    except IndexError:
                        self.list.append("** error: missing label")

                except IndexError:
                    self.list.append("** error: missing second source")

            except IndexError:
                self.list.append("** error: missing first source")

        # Br
        elif switch == 1:
            try:
                self.label_check(operand[0])

            except IndexError:
                self.list.append("** error: no label")

        self.warning_label(opcode, operand)

    def warning_label(self, opcode, operand):
        if opcode == self.instruction.get(1):
            try:
                self.branch[self.count] = operand

            except IndexError:
                pass

        elif opcode == self.instruction.get(4) or opcode == self.instruction.get(3) or opcode == self.instruction.get(2):
            try:
                self.branch[self.count] = operand[2]

            except IndexError:
                pass



    def file_end(self):
        self.log.write("log file for " + self.file_name + ".mal " +
                       " named " + self.file_name + ".log " + time.ctime() + " By Joey Brennan" + '\n')

        for line in sorted(self.print_line.keys()):
            self.log.write('{}'.format(line))
            self.log.write(": " + self.print_line.get(line) + '\n')

            print('{}'.format(line) + ": " + self.print_line.get(line) + '\n')

            if line in self.errors.keys():
                for error in self.errors.get(line):
                    self.log.write(error + '\n')

                    print(error + '\n')

            self.log.write('\n')
            print('\n')

        self.log.close()

    # check of source correctness
    def source_check(self, source):
        if source[0] == "R" and source[1].isdigit():
            if source not in self.register.values():
                self.list.append("** error: registers are only between 0 and 7")
                return

        elif not source.isalpha():
            self.list.append("** error: source can only contains letters")
            return

        elif not len(source) > 5:
            self.list.append("** error: source can at most be 5 char long")
            return

    # check of destination correctness
    def destination_check(self, destination):
        if destination[0] == "R" and destination[1].isdigit():
            if destination not in self.register.values():
                self.list.append("** error: registers are only between 0 and 7")
                return

        elif not destination.isalpha():
            self.list.append("** error: destination can only contains letters")
            return

        elif not len(destination) > 5:
            self.list.append("** error: destination can at most be 5 char long")
            return

    # check of integer value
    def immediate_check(self, immediate):
        if immediate.isdigit():
            for number in immediate:
                if int(number) > 7:
                    self.list.append("** error: number is not in octal")
                    return
            return

        else:
            return

    # check of label to branch
    def label_check(self, label):
        if not label.isalpha():
            self.list.append("** error: label can only contains letters")
            return

        elif not len(label) > 5:
            self.list.append("** error: label can at most be 5 char long")
            return

    def branch_checker(self):
        for key in self.branch.keys():
            if self.branch.get(key) != self.label:
                self.errors[key].append("** error: branch is to label that isn't defined")

            else:
                continue


if __name__ == '__main__':
    file_name = "mal_test"  # input("what is the name of the mal file?")
    mal = MalChecking(file_name)
    mal.read_file()
