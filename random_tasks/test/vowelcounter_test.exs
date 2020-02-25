defmodule VowelcounterTest do
  use ExUnit.Case
  doctest Vowelcounter

  test "returns right number of given vowel" do
    assert Vowelcounter.get_vowels_from_text("This is a test written in elixir", "e") == 3
  end

  test "returns 0 when no text" do
    assert Vowelcounter.get_vowels_from_text("", "e") == 0
  end

  test "returns error when no text" do
    {atom, message} = Vowelcounter.get_vowels_from_text(["h", "e", "l", "l", "o"], "e")
    assert atom == :error
    assert message = {:no_text, "Text is not given"}
  end

  test "returns error when no vowel" do
    {atom, message} = Vowelcounter.get_vowels_from_text("hello", "h")
    assert atom == :error
    assert message = {:no_vowel, "Vowel is not given"}
  end
end
