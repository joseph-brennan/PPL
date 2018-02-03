"""
Joey Brennan
Project 1 Mal Syntax Checking
"""
import time


class MalChecking:
    def __init__(self, file_name):
        """
        initial set up of the language definition with the known syntax of MAL

        :param file_name: name of the mall file to check
        """
        self.file_name = file_name

        self.mal_file = open("{}.mal".format(file_name), 'r')

        self.log = open("{}.log".format(file_name), 'w')

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

        # count of each error that occurred
        self.error_count = {"ill-formed label": 0, "invalid op_code": 0, "too many operands": 0,
                            "too few operands": 0, "ill-formed operands": 0,
                            "wrong operand type": 0, "label warnings": 0}

    def read_file(self):
        """
        File parser where comments and blank lines are removed but line count is saved once the file has been read it
        checks the branch against the labels and closes the file
        :return: at end of file read and log write
        """
        for i in self.mal_file:
            line = i.strip()
            self.count += 1

            # blank line move forward
            if line == '\n' or line == '':
                continue

            # skip the comments
            if line.startswith(";"):
                continue

            # known end of file
            if line == "END":
                break

            else:
                line = line.partition(';')

                self.print_line[self.count] = line[0].strip()

                self.error_checking(line[0].strip())

        self.branch_checker()

        self.mal_file.close()

        self.file_end()

    def error_checking(self, line):
        """
        where current line of code is handed down to all the error checking is saved all the error files
        :param line: current line of non empty string
        :return: when the line is finished the checks returns for next line in file
        """

        self.bad_label(line)

        self.errors[self.count] = self.list.copy()

        self.list.clear()

    def bad_label(self, line):
        """
        checks for if there is a label and then verifies the label is valid
        :param line: current line of code in its complete form
        :return: has finished all error checks or there is only a label on the line
        """
        label = line.partition(":")

        # there is a label
        if label[1] == ':':
            # only a label
            if label[2] == '':
                if not label[0].isalpha():
                    self.list.append("** error: label can only contains letters")

                    self.error_count["ill-formed label"] += 1

                elif len(label[0]) > 5:
                    self.list.append("** error: label can at most be 5 char long")

                    self.error_count["ill-formed label"] += 1

                # valid label
                else:
                    self.label.append(label[0])

                return

            # label on line
            else:
                if not label[0].isalpha():
                    self.list.append("** error: label can only contains letters")

                    self.error_count["ill-formed label"] += 1

                elif len(label[0]) > 5:
                    self.list.append("** error: label can at most be 5 char long")

                    self.error_count["ill-formed label"] += 1

                # valid label
                else:
                    self.label.append(label[0])

                self.invalid_op_code(label[2].strip())

                return

        # no label
        else:
            self.invalid_op_code(label[0].strip())
            return

    def invalid_op_code(self, line):
        """
        current line of code without a label if there was one, verifies that the instruction code is a valid MAL one
        :param line: current line of MAL without a label
        :return: all checks have been preformed
        """
        op_code = line.partition(" ")

        if op_code[0] in self.instruction.values():
            # valid op_code
            self.bad_operands(line)
            return

        else:
            self.list.append("** error: invalid op_code")

            self.error_count["invalid op_code"] += 1

            self.bad_operands(line)
            return

    def bad_operands(self, line):
        """
        splits out the instruction from its operands and checks that the op_code has the right number of operands
        :param line: instruction and its operands``
        :return: this check and all deeper checks have been preformed
        """
        op_code = line.partition(" ")

        operand = op_code[2].split(",")

        operands = []

        for op in operand:
            operands.append(op.strip())

        switch = 0

        if op_code[0] in self.instruction.values():
            for key in self.instruction.keys():
                if self.instruction.get(key) == op_code[0]:
                    switch = key

            if switch == 1:
                if len(operands) > 1:
                    self.list.append("** error: can only have one label for BR")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 1:
                    self.list.append("** error: needs one label for BR")

                    self.error_count["too few operands"] += 1

            elif switch == 2:
                if len(operands) > 3:
                    self.list.append("** error: can only have 3 arguments in BLT")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 3:
                    self.list.append("** error: needs 3 arguments for BLT two to compare third label")

                    self.error_count["too few operands"] += 1

            elif switch == 3:
                if len(operands) > 3:
                    self.list.append("** error: can only have 3 arguments in BLT")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 3:
                    self.list.append("** error: needs 3 arguments for BLT, two to compare, third label")

                    self.error_count["too few operands"] += 1

            elif switch == 4:
                if len(operands) > 3:
                    self.list.append("** error: can only have 3 arguments in BEQ")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 3:
                    self.list.append("** error: needs 3 arguments for BEQ, two to compare, third label")

                    self.error_count["too few operands"] += 1

            elif switch == 5:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination DIV")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 3:
                    self.list.append("** error: needs two inputs and a destination for DIV")

                    self.error_count["too few operands"] += 1

            elif switch == 6:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination MUL")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 3:
                    self.list.append("** error: need two inputs and a destination for MUL")

                    self.error_count["too few operands"] += 1

            elif switch == 7:
                if len(operands) > 1:
                    self.list.append("** error: can only have one source location for DEC")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 1:
                    self.list.append("** error: needs one at least one source DEC")

                    self.error_count["too few operands"] += 1

            elif switch == 8:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination SUB")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 3:
                    self.list.append("** error: need two inputs and a destination for SUB")

                    self.error_count["too few operands"] += 1

            elif switch == 9:
                if len(operands) > 1:
                    self.list.append("** error: can only have one source location for INC")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 1:
                    self.list.append("** error: needs one at least one source INC")

                    self.error_count["too few operands"] += 1

            elif switch == 10:
                if len(operands) > 3:
                    self.list.append("** error: can only have two inputs and a destination ADD")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 3:
                    self.list.append("** error: need two inputs and a destination for ADD")

                    self.error_count["too few operands"] += 1

            elif switch == 11:
                if len(operands) > 2:
                    self.list.append("** error: must have one immediate and one destination MOVEI")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 2:
                    self.list.append("** error: needs one immediate and one destination MOVIE")

                    self.error_count["too few operands"] += 1

            elif switch == 12:
                if len(operands) > 2:
                    self.list.append("** error: must have one source and one destination MOVE")

                    self.error_count["too many operands"] += 1

                elif len(operands) < 2:
                    self.list.append("** error: needs one source and one destination MOVE")

                    self.error_count["too few operands"] += 1

        self.wrong_operands(op_code[0], operands)
        return

    def wrong_operands(self, op_code, operand):
        """
        using the work performed before to separate the instruction from its operands it checks each type of operand in
        the instruction is the correct type
        :param op_code: the instruction
        :param operand: the operands for the instruction
        :return: this and the last error check have been performed
        """
        switch = 0

        for key in self.instruction.keys():
            if self.instruction.get(key) == op_code:
                switch = key
        # Move
        if switch == 12:
            try:
                self.source_check(operand[0])

                try:
                    self.destination_check(operand[1])

                except IndexError:
                    self.list.append("** error: no destination")

                    self.error_count["ill-formed operands"] += 1

            except IndexError:
                self.list.append("** error: no source")

                self.error_count["ill-formed operands"] += 1

        # MoveI
        elif switch == 11:
            try:
                self.immediate_check(operand[0])

                try:
                    self.destination_check(operand[1])

                except IndexError:
                    self.list.append("** error: no destination")

                    self.error_count["ill-formed operands"] += 1

            except IndexError:
                self.list.append("** error: no source")

                self.error_count["ill-formed operands"] += 1

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

                        self.error_count["ill-formed operands"] += 1

                except IndexError:
                    self.list.append("** error: second source missing")

                    self.error_count["ill-formed operands"] += 1

            except IndexError:
                self.list.append("** error: first source missing")

                self.error_count["ill-formed operands"] += 1

        # Inc or Dec
        elif switch == 9 or switch == 7:
            try:
                self.source_check(operand[0])

            except IndexError:
                self.list.append("** error: missing source")

                self.error_count["ill-formed operands"] += 1

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

                        self.error_count["ill-formed operands"] += 1

                except IndexError:
                    self.list.append("** error: missing second source")

                    self.error_count["ill-formed operands"] += 1

            except IndexError:
                self.list.append("** error: missing first source")

                self.error_count["ill-formed operands"] += 1

        # Br
        elif switch == 1:
            try:
                self.label_check(operand[0])

            except IndexError:
                self.list.append("** error: no label")

                self.error_count["ill-formed operands"] += 1

        self.warning_label(op_code, operand)

    def warning_label(self, op_code, operand):
        """
        If there is a branch instruction add it to a dictionary keyed by the line number where the instruction is found
        so at the end of the file it can be compared to the list of labels
        :param op_code: what should be a branch instruction
        :param operand: the operands of the instruction
        :return: after saving the branch label for the end of the file
        """
        # BR
        if op_code == self.instruction.get(1):
            try:
                self.branch[self.count] = operand[0]

            except IndexError:
                pass

        # BGT or BLT or BEQ
        elif op_code == self.instruction.get(4) or \
                        op_code == self.instruction.get(3) or \
                        op_code == self.instruction.get(2):

            try:
                self.branch[self.count] = operand[2]

            except IndexError:
                pass

    # check of source correctness
    def source_check(self, source):
        """
        checks that source operands are of the right type
        :param source: a source operand
        :return: after checking and writing to an error if it found one
        """
        if source[0] == "R" and source[1].isdigit():
            if source not in self.register.values():
                self.list.append("** error: registers are only between 0 and 7")

                self.error_count["wrong operand type"] += 1
                return

        elif source.lower().isalpha() is False:
            self.list.append("** error: source can only contains letters")

            self.error_count["wrong operand type"] += 1
            return

        elif len(source) > 5:
            self.list.append("** error: source can at most be 5 char long")

            self.error_count["wrong operand type"] += 1
            return

    # check of destination correctness
    def destination_check(self, destination):
        """
        check that the destination operands are of teh right type
        (almost the same as the source but it has different error code to be more useful)
        :param destination: a destination operand
        :return: after checking and writing its error if it found one
        """
        if destination[0] == "R" and destination[1].isdigit():
            if destination not in self.register.values():
                self.list.append("** error: registers are only between 0 and 7")

                self.error_count["wrong operand type"] += 1
                return

        elif destination.isalpha() is False:
            self.list.append("** error: destination can only contains letters")

            self.error_count["wrong operand type"] += 1
            return

        elif len(destination) > 5:
            self.list.append("** error: destination can at most be 5 char long")

            self.error_count["wrong operand type"] += 1
            return

    # check of integer value
    def immediate_check(self, immediate):
        """
        checks that there is an octal immediate value
        :param immediate: what should be an octal number
        :return: after checking and writing an error if found
        """
        if immediate.isdigit():
            for number in immediate:
                if int(number) > 7:
                    self.list.append("** error: number is not in octal")

                    self.error_count["wrong operand type"] += 1
                    return
            return

        else:
            self.list.append("** error: immediate value expected")

            self.error_count["wrong operand type"] += 1
            return

    # check of label to branch
    def label_check(self, label):
        """
        check that a branch label is a valid memory location and later the label is checked for if the label is a label
        in the code
        :param label: a memory location
        :return: checks that the label and rights an error if found
        """
        if not label.isalpha():
            self.list.append("** error: label can only contains letters")

            self.error_count["wrong operand type"] += 1
            return

        elif len(label) > 5:
            self.list.append("** error: label can at most be 5 char long")

            self.error_count["wrong operand type"] += 1
            return

    def branch_checker(self):
        """
        checks the valid labels in the code against the branch instruction labels after the whole file as been read
        for the final error check
        :return: after writing a error if the label branching to doesn't exist
        """
        for key in self.branch.keys():
            if self.branch.get(key) not in self.label:
                self.errors[key].append("** error: branch is to label that isn't defined")

                self.error_count["label warnings"] += 1

            else:
                continue

    def file_end(self):
        """
        this writes to the log file all the information that the error checking has done
        :return: finished witting and closed the log filed
        """
        self.log.write("MAL File Checker for: {}.mal log file, named {}.log, {}, By Joey Brennan CS 3210\n".format(
            self.file_name, self.file_name, time.ctime()))

        self.log.write("-------------------------------------------------------\n")

        true_count = 0
        for line in sorted(self.print_line.keys()):
            true_count += 1

            self.log.write("{}: {}\n".format(line, self.print_line.get(line)))

            if line in self.errors.keys():
                for error in self.errors.get(line):
                    self.log.write("{}\n".format(error))

            self.log.write('\n')

        self.log.write("-------------------------------------------------------\n")

        count = 0

        for key in sorted(self.error_count.keys()):
            count += self.error_count.get(key)

        self.log.write("total lines of code = {}\ntotal errors = {}\n".format(true_count, count))

        for key in sorted(self.error_count.keys()):
            self.log.write("{} {}\n".format(self.error_count.get(key), key))

        self.log.write("Processing complete: ")

        if count > 0:
            self.log.write("MAL program is not valid.")

        else:
            self.log.write("MAL program is valid.")

        self.log.close()


if __name__ == '__main__':
    while True:
        name = input("what is the name of the MAL file? ")

        mal = MalChecking(name)
        mal.read_file()

        loop = input("would you like to check another file Y/n? ")

        if loop.lower() == "no" or loop.lower() == "n":
            break

        else:
            continue
