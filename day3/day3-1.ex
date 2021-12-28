{:ok, input} = File.read("input")

lines = String.split(input, "\n", trim: true)
length = Enum.count(lines)

gamma =
  lines
  |> Enum.map(fn row ->
    row
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end)
  |> Enum.reduce(fn l, r -> Enum.zip_with(l, r, &(&1 + &2)) end)
  |> Enum.map(fn bit ->
    if bit > length / 2 do
      1
    else
      0
    end
  end)

epsilon =
  Enum.map(gamma, fn bit ->
    if bit == 1 do
      0
    else
      1
    end
  end)

total = Integer.undigits(gamma, 2) * Integer.undigits(epsilon, 2)
IO.puts(total)
