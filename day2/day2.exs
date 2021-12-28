calculate = fn input ->
  directions =
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [name, val] = String.split(line, " ", trim: true)
      %{name: name, val: String.to_integer(val)}
    end)
    |> Enum.group_by(fn entry -> entry.name end)

  [down, forward, up] =
    Enum.map(directions, fn {_direction, steps} ->
      Enum.reduce(steps, 0, fn x, acc ->
        acc + x.val
      end)
    end)

  result = (down - up) * forward
  IO.puts(result)
end

case File.read("input") do
  {:ok, content} -> calculate.(content)
  {:error} -> IO.puts("error reading file")
end
