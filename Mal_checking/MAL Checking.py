"""
Joey Brennan
Project 1 Mal Syntax Checking
"""


class MalChecking:
    def __init__(self, file_name):
        self.file_name = file_name
        self.mal_file = open(file_name, 'r+')

    def error_checking(self):
        pass

    def bad_label(self):
        pass

    def invalid_opcode(self):
        pass

    def bad_high_operands(self):
        pass

    def bad_low_operands(self):
        pass

    def wrong_operands(self):
        pass

    def bad_type(self):
        pass

    def warning_label(self):
        pass


if __name__ == '__main__':
    file_name = input("what is the name of the mal file?")

    mal = MalChecking(file_name)

