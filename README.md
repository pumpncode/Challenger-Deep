# Challenger Deep

This is a Balatro mod that adds several rules that can be added to Challenges, for example banning Editions.

## Rule List

Below is a comprehensive list of rules added by the mod. The string in each entry should replace "example" in `{id = "example"}`.
For rules with a value variable, the whole item will be typed out, such as `{id = "example", value = x}`, where the required input for x will be specified.

### Banning Editions

- `"no_editions"` - Removes every edition from every card.
- `"no_edition_jokers"` - Removes editions from Jokers.
- `"no_edition_cards"` - Removes editions from Playing Cards.

### Banning Specific Editions

Currently supported editions: `foil`, `holo`, `polychrome`, `negative` (Jokers only), `fluorescent` (Bunco), `glitter` (Bunco)
- `"no_(EDITION)s"` - Removes (EDITION) from every card.
- `"no_(EDITION)_jokers` - Removes (EDITION) from jokers.
- `"no_(EDITION)_cards"` - Removes (EDITION) from Playing Cards.

### Blind requirement scaling

- `{id = "blind_scaling", value = x}` - Multiplies the chip requirement for every blind by x, where x is a number. For best results, I would suggest x is between 1 and 3.

### "Joker Fun"

This is where most rules about Jokers will go.
- `{id = "minus_jokers_per_dollar", value = x}` - Joker slots decreases by 1 for every $x, where x is a number. x cannot be zero, and I would suggest x is between 3 and 10.
- `"overflow_perishable"` - When the player has more Jokers than Joker slots, every joker becomes Perishable. This is removed when the player has less Jokers than Joker slots.
- `"overflow_debuff"` - When the player has more Jokers than Joker slots, every joker is debuffed. This is removed when the player has less Jokers than Joker slots.

## Note
This mod is intended as a tool for other mods to use, and does not have any standalone functionality.
