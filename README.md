# Challenger Deep

This is a Balatro mod that adds several rules that can be added to Challenges, for example banning Editions.

## Rule List

Below is a comprehensive list of rules added by the mod. The string in each entry should replace "example" in `{id = "example"}`.

### Banning Editions

- `"no_editions"` - Removes every edition from every card.
- `"no_edition_jokers"` - Removes editions from Jokers.
- `"no_edition_cards"` - Removes editions from Playing Cards.

### Banning Specific Editions

Currently supported editions: `foil`, `holo`, `polychrome`, `negative` (Jokers only), `fluorescent` (Bunco), `glitter` (Bunco)
- `"no_(EDITION)s"` - Removes (EDITION) from every card.
- `"no_(EDITION)_jokers` - Removes (EDITION) from jokers.
- `"no_(EDITION)_cards"` - Removes (EDITION) from Playing Cards.
