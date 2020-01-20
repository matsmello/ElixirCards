defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns list of playing deck cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits  = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits , value <- values  do
      "#{suit} - #{value}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Returns hand of deck cards based on `hand_size`
    and the rest of this respective list

    ## Example

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Spades - Ace"]
  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:error, _reason} -> "File not found"
      {:ok, binary} -> :erlang.binary_to_term binary
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
