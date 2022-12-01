from typing import List, TextIO
from functools import reduce
from pathlib import Path


def most_calories_in_list(calories_carried: List[List[int]]) -> int:
    # Pre: len(calories_carried) > 0
    total_calories: List[int] = list(map((sum, calories_carried)))
    most_calories: int = reduce((lambda x, y: x if x > y else y), total_calories)
    return most_calories


def create_list_from_input(path: Path = Path("input.txt")) -> List[List[int]]:
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
