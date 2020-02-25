defmodule Vowelcounter do
  def get_vowels_from_text(text, vowel) do
    with {:is_bitstring, true} <- {:is_bitstring, is_bitstring(text)},
         {:is_vowel, true} <- {:is_vowel, is_vowel(vowel)} do
      text
      |> String.graphemes()
      |> Enum.count(&(&1 == vowel))
    else
      {:is_bitstring, false} -> {:error, {:no_text, "Text is not given"}}
      {:is_vowel, false} -> {:error, {:no_vowel, "Vowel is not given"}}
    end
  end

  defp is_vowel(data) do
    with 1 <- String.length(data),
         true <- data in get_all_vowels() do
      true
    else
      _ -> false
    end
  end

  defp get_all_vowels(), do: ["a", "e", "i", "o", "u", "y"]
end
