def main() -> None:
    INPUT: str = "input.txt"
    first_two_nums: list[tuple[int, int]] = parse(INPUT)
    line_values = map(turn_into_two_digit_number, first_two_nums)
    res: int = sum(line_values)
    print(res)

def parse(input_file_name: str) -> list[tuple[int, int]]:
    res: list[tuple[int, int]] = []
    with open(input_file_name, 'r') as f:
        line = f.readline()
        while line:
            res.append(parse_line(line))
            line = f.readline()
    return res

def parse_line(line: str) -> tuple[int, int]:
    nums: list[int] = []
    for c in line:
        if c.isnumeric():
            nums.append(int(c))
    assert len(nums) > 0
    return nums[0], nums[-1]

def turn_into_two_digit_number(numbers: tuple[int, int]) -> int:
    tens, units = numbers
    return 10 * tens + units

if __name__ == "__main__":
    main()
