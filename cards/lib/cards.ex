defmodule Cards do
  def create_deck do
    vals = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Diamonds", "Hearts", "Spades", "Clubs"]

    for suit <- suits, val <- vals do
      "#{val} of #{suit}"
    end
    
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    {status, binary} = File.read(file_name)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end
  
end
