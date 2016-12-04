defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Map.delete(countEveryWord(String.split(formatString(sentence), [" "])), "")
  end

  # construction de la map pour tous les mot de la phrase
  defp countEveryWord([head | tail]) do
    Map.merge(constructMap(head, [head | tail]), countEveryWord(deleteWord(tail, head)))
  end

  defp countEveryWord([]) do
    %{}
  end

  # contruit une map avec en clef le mot et en valeur son nombre d'occurrences
  defp constructMap(word, list_word) do
    %{word => countWord(word, list_word)}
  end

  # compte le nombre d'occurrences d'un mot dans la phrase
  defp countWord(word, [head | tail]) when word == head do
    1 + countWord(word, tail)
  end

  defp countWord(word, [head | tail]) do
    countWord(word, tail)
  end

  defp countWord(word, []) do 0 end

  # supprime toutes les occurences du mot
  defp deleteWord([head | tail], word) when head == word do
    [] ++ deleteWord(tail, word)
  end

  defp deleteWord([head | tail], word) do
    [head] ++ deleteWord(tail, word)
  end

  defp deleteWord([], word) do
    []
  end

  # mise au format demandé
  defp formatString(sentence) do
    sentence
    |> replacePunctuation
    |> replaceUnderscore
    |> downcase
  end

  defp replaceUnderscore(sentence) do
    String.replace(sentence, "_", " ")
  end

  defp replacePunctuation(sentence) do
    String.replace(sentence, ~r/[!@#$%^&*()+=;:'',.<>]+/, "")
  end

  defp downcase(sentence) do
    String.downcase(sentence)
  end
end
