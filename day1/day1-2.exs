calculate = fn content ->
  content
  |> String.split("\n", trim: true)
  |> Enum.map(&String.to_integer/1)
  |> Enum.chunk_every(3, 1, :discard)
  |> Enum.chunk_every(2, 1, :discard)
  |> Enum.count(fn group ->
    [left, right] = group
    Enum.sum(left) < Enum.sum(right)
  end)
  |> IO.inspect()
end

case File.read("input") do
  {:ok, content} -> calculate.(content)
  {:error} -> IO.puts("error reading file")
end
