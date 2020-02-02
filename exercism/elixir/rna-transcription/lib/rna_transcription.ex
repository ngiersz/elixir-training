defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.chunk_every(1)
    |> Enum.map(&get_rna_nucleotide/1)
    |> Enum.join
    |> to_charlist
  end

  def get_rna_nucleotide(dna_nucleotide) do
    case(to_string(dna_nucleotide)) do
      "G" -> 'C'
      "C" -> 'G'
      "T" -> 'A'
      "A" -> 'U'
    end
  end

end
