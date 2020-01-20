defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "create_deck should returns 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffle should returns different deck" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
