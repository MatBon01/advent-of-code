from typing import Callable


def main() -> None:
    INPUT: str = "input.txt"
    part1(INPUT)
    part2(INPUT)


def part1(input_file_name: str) -> None:
    first_two_nums: list[tuple[int, int]] = parse(
        input_file_name, spelled_out_numbers=False
    )
    line_values = map(turn_into_two_digit_number, first_two_nums)
    res: int = sum(line_values)
    print(res)


def part2(input_file_name: str) -> None:
    first_two_nums: list[tuple[int, int]] = parse(
        input_file_name, spelled_out_numbers=False
    )


def parse(input_file_name: str, spelled_out_numbers: bool) -> list[tuple[int, int]]:
    parse_line: Callable[[str], tuple[int, int]] = parse_line_only_ints
    if spelled_out_numbers:
        parse_line = parse_line_with_spelled_out_numbers

    res: list[tuple[int, int]] = []
    with open(input_file_name, "r") as f:
        line = f.readline()
        while line:
            res.append(parse_line(line))
            line = f.readline()
    return res


def parse_line_only_ints(line: str) -> tuple[int, int]:
    nums: list[int] = []
    for c in line:
        if c.isnumeric():
            nums.append(int(c))
    assert len(nums) > 0
    return nums[0], nums[-1]


def parse_line_with_spelled_out_numbers(line: str) -> tuple[int, int]:
    return 0, 0


def turn_into_two_digit_number(numbers: tuple[int, int]) -> int:
    tens, units = numbers
    return 10 * tens + units


if __name__ == "__main__":
    main()
