from typing import List, TextIO
import sys
from functools import reduce
from pathlib import Path

ELVES_TO_CONSIDER_INDEX: int = 1
DEFAULT_NUM_ELVES: int = 1

INPUT_FILE_INDEX: int = 2
DEFAULT_INPUT_FILE: str = "input.txt"


def most_calories_in_list(
    calories_carried: List[List[int]], elves_to_consider: int = DEFAULT_NUM_ELVES
) -> int:
    # Pre: n > 0
    # Pre: len(calories_carried) >= n
    total_calories: List[int] = list(map(sum, calories_carried))
    total_calories.sort(reverse=True)
    calories_considered: List[int] = total_calories[:elves_to_consider]
    return sum(calories_considered)


def create_list_from_input(path: Path = Path(DEFAULT_INPUT_FILE)) -> List[List[int]]:
    calories_carried: List[List[int]] = []
    calories_carried_by_current_elf: List[int] = []
    f: TextIO
    with open(path) as f:
        line: str
        for line in f:
            if line == "\n":
                calories_carried.append(calories_carried_by_current_elf)
                calories_carried_by_current_elf = []
            else:
                calories_carried_by_current_elf.append(int(line))
    return calories_carried


def main():
    path: Path = Path(DEFAULT_INPUT_FILE)
    elves_to_consider: int = DEFAULT_NUM_ELVES
    if len(sys.argv) > ELVES_TO_CONSIDER_INDEX:
        elves_to_consider = int(sys.argv[ELVES_TO_CONSIDER_INDEX])
    if len(sys.argv) > INPUT_FILE_INDEX:
        path = Path(sys.argv[INPUT_FILE_INDEX])
    calories_carried: List[List[int]] = create_list_from_input(path)
    most_calories: int = most_calories_in_list(calories_carried, elves_to_consider)
    print(most_calories)


if __name__ == "__main__":
    main()
