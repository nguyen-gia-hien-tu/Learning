package main

import (
	"fmt"
	"os"
	"strings"
)

// Create a new type called 'deck', which is a slice of strings
type deck []string

func newDeck() deck {
	cards := deck{}

	cardSuits := []string{"Spades", "Diamonds", "Hearts", "Clubs"}
	cardValues := []string{"Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"}

	for _, suit := range cardSuits {
		for _, value := range cardValues {
			cards = append(cards, value+" of "+suit)
		}
	}

	return cards
}

func (cardDeck deck) printDeck() {
	for i, card := range cardDeck {
		fmt.Println(i+1, card)
	}
}

func deal(cardDeck deck, handSize int) (deck, deck) {
	return cardDeck[:handSize], cardDeck[handSize:]
}

func (cardDeck deck) toString() string {
	return strings.Join([]string(cardDeck), ",")
}

func (cardDeck deck) saveToFile(filename string) error {
	return os.WriteFile(filename, []byte(cardDeck.toString()), 0644)
}

func newDeckFromFile(filename string) deck {
	bs, err := os.ReadFile(filename)
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}

	return deck(strings.Split(string(bs), ","))
}
