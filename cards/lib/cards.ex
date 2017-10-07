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
  
end
