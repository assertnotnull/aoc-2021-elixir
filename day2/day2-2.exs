calculate = fn input ->
  input
  |> String.split("\n", trim: true)
  |> Enum.map(fn line ->
    [name, val] = String.split(line, " ", trim: true)
    %{name: name, val: String.to_integer(val)}
  end)
  |> Enum.reduce(%{hor: 0, aim: 0, depth: 0}, fn direction, acc ->
    case direction do
      %{name: "forward", val: val} ->
        %{hor: acc.hor + val, aim: acc.aim, depth: acc.depth + acc.aim * val}

      %{name: "down", val: val} ->
        %{hor: acc.hor, aim: acc.aim + val, depth: acc.depth}

      %{name: "up", val: val} ->
        %{hor: acc.hor, aim: acc.aim - val, depth: acc.depth}
    end
  end)
  |> then(fn position -> position.hor * position.depth end)
  |> IO.inspect()
end

case File.read("input") do
  {:ok, content} -> calculate.(content)
  {:error} -> IO.puts("error reading file")
end
