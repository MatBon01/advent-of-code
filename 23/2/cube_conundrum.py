from enum import Enum, auto

def main() -> None:
    INPUT_FILE = "input.txt"
    print(parse_input(INPUT_FILE))

class Colour(Enum):
    RED = auto()
    GREEN = auto()
    BLUE = auto()

colour_translation = {"red": Colour.RED, "green": Colour.GREEN, "blue": Colour.BLUE}

def parse_input(input_file_name: str) -> list[list[dict[Colour, int]]]:
    res: list[list[dict[Colour, int]]] = []
    with open(input_file_name, "r") as f:
        for line in f:
            res.append(parse_line(line[:-1])) # removes \n from line
    return res

def parse_line(line: str) -> list[dict[Colour, int]]:
    _, rounds = line.split(": ")
    return parse_rounds(rounds)

def parse_rounds(rounds: str) -> list[dict[Colour, int]]:
    round_list: list[str] = rounds.split("; ")
    return list(map(lambda x: parse_round(x), round_list))

def parse_round(round: str) -> dict[Colour, int]:
    res = {}
    colour_stats = round.split(", ")
    for colour_stat in colour_stats:
        num, colour_name = colour_stat.split(" ")
        colour = colour_translation[colour_name]
        res[colour] = num
    return res

if __name__ == "__main__":
    main()
