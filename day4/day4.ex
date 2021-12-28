input = """
7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
"""

lines =
  input
  |> String.split("\n", trim: true)

[raw_picked | raw_boards] = lines

picked = String.split(raw_picked, ",", trim: true)

boards =
  raw_boards
  |> Enum.map(fn row ->
    row
    |> String.split(" ", trim: true)
    |> Enum.map(fn val -> %{:number => val, marked: false} end)
  end)
  |> Enum.chunk_every(5)

mark_boards = fn boards, [str_number | others] ->
  updated_boards =
    boards
    |> Enum.map(fn board ->
      Enum.map(board, fn row ->
        Enum.map(row, fn entry ->
          # %{val => flag} = entry
          IO.inspect(str_number)
          IO.inspect(entry)

          if entry.number == str_number do
            %{entry | marked: true}
          else
            %{entry | marked: false}
          end
        end)
      end)
    end)

  mark_boards.(updated_boards, others)
end

mark_boards.(boards, picked)
