defmodule Cards do
  @moduledoc """
    Methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    vals = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Diamonds", "Hearts", "Spades", "Clubs"]

    for suit <- suits, val <- vals do
      "#{val} of #{suit}"
    end
    
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. The `hand_size` argument (int) determines the size of the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Diamonds"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end


  @doc """
    Uses Enum to shuffle a deck of cards
  """
  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  @doc """
    Uses Enum to check if deck contains a card (string)
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Saves deck to filesystem using Erlang term_to_binary call
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Retrieves a saved deck using Erland binary_to_term call
  """
  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary}  -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  @doc """
    Creates a hand from a shuffled deck

  ## Examples

      iex> 
      iex> {hand, deck} = Cards.create_hand(5)
      iex> hand
      ["A", "List", "of", "5", "cards"]
  """
  def create_hand(hand_size) do
    #use pipe operator to pass return value as first arg to next func
    
    Cards.create_deck 
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
  
end
