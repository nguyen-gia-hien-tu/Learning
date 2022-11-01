package main

import "fmt"

func main() {
	// cards := deck{"Five of Diamonds", "Ace of Hearts", newCard()}
	// cards = append(cards, "Six of Spades")

	// var i int
	// var card string
	// for i, card = range cards {
	// 	fmt.Println(i, card)
	// }

	// for i, card := range cards {
	// 	fmt.Println(i, card)
	// }

	cards := newDeck()

	var hand, remainingCards deck
	hand, remainingCards = deal(cards, 10)
	hand.printDeck()
	fmt.Println()
	remainingCards.printDeck()
	fmt.Println()

	greeting := "Hi there!"
	fmt.Println([]byte(greeting))
	fmt.Println()

	// Stringify the deck called "cards" by adding "," to separate each element
	fmt.Println(cards.toString())
	fmt.Println()

	// Save deck called "cards" to the file named "cards.txt"
	fmt.Println("Save card deck to file:")
	cards.saveToFile("cards.txt")
	fmt.Println("Done\n")

	// Read card deck from the file named "cards.txt"
	fmt.Println("Read from File:")
	newCards := newDeckFromFile("cards.txt")
	fmt.Println(newCards.toString())

}
