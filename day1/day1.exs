check = fn val, acc ->
  num = String.to_integer(val)

  if acc.val < num do
    %{val: num, increments: acc.increments + 1}
  else
    %{val: num, increments: acc.increments}
  end
end

getIncrements = fn %{val: _val, increments: increments} ->
  increments - 1
end

calculate = fn content ->
  content
  |> String.split("\n", trim: true)
  |> Enum.reduce(%{val: 0, increments: 0}, check)
  |> getIncrements.()
  |> IO.puts()
end

case File.read("input") do
  {:ok, content} -> calculate.(content)
  {:error} -> IO.puts("error reading file")
end

IO.puts("done")
