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

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary}  -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    #use pipe operator to pass return value as first arg to next func
    Cards.create_deck 
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
  
end
