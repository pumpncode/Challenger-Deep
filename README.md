# Challenger Deep

This is a Balatro mod that adds several rules that can be added to Challenges, for example banning Editions.

## Rule List

Below is a comprehensive list of rules added by the mod. The string in each entry should replace "example" in `{id = "example"}`.
For rules with a value variable, the whole item will be typed out, such as `{id = "example", value = x}`, where the required input for x will be specified.

### Banning Editions

#### Every Edition

- `"no_editions"` - Removes every edition from every card.
- `"no_edition_jokers"` - Removes editions from Jokers.
- `"no_edition_cards"` - Removes editions from Playing Cards.

#### Specific Editions

Currently supported editions: `foil`, `holo`, `polychrome`, `negative` (Jokers only), `fluorescent` (Bunco), `glitter` (Bunco)
- `"no_(EDITION)s"` - Removes (EDITION) from every card.
- `"no_(EDITION)_jokers` - Removes (EDITION) from jokers.
- `"no_(EDITION)_cards"` - Removes (EDITION) from Playing Cards.

### Blinds

- `{id = "blind_scaling", value = x}` - Multiplies the chip requirement for every blind by x, where x is a number. For best results, I would suggest x is between 1 and 3.
- `{id = "money_scaling", value = x}` - Multiplies all blind rewards by x. At the moment, this is not visual.

### Jokers

#### Joker Slot rules

- `{id = "minus_jokers_per_dollar", value = x}` - Joker slots decreases by 1 for every $x, where x is a number. x cannot be zero, and I would suggest x is between 3 and 10.
- `"overflow_perishable"` - When the player has more Jokers than Joker slots, every joker becomes Perishable. This is removed when the player has less Jokers than Joker slots.
- `"overflow_debuff"` - When the player has more Jokers than Joker slots, every joker is debuffed. This is removed when the player has less Jokers than Joker slots.
- `"overflow_debuff_one"` - A reworked version of `"overflow_debuff"` suggested by MiniRebel. For each Joker > Joker Slots, a random Joker is debuffed.

#### Per Joker rules

- `"hand_per_joker"` - Player gains one hand per Joker owned.
- `"minus_discard_per_joker"` - Player loses a discard per Joker owned.

#### Stickers

- `"enable_eternal_jokers"`, `"enable_rental_jokers"`,`"enable_perishable_jokers"` - Jokers can have the specified Sticker.
- `"all_rental_jokers"`, `"all_perishable_jokers"` - All Jokers will have the specified Sticker. (Perishable may not function currently.)
- `"rentals_keep_price"` - Rental Jokers will retain their price.
- `{id = "rental_rate", value = x}` - Rental Jokers will have their rate set to x dollars. At the end of a round, for each Rental Joker, x dollars will be deducted from the player.
- `{id = "perishable_rounds", value = x}` - Perishable Jokers will be debuffed after x rounds.

### Shop

- `"no_vouchers"` - Vouchers do not appear. (NOTE: Voucher Tag crashes the game when this is enabled.)

### Miscellaneous Rules

- `{id = "win_ante", value = x}` - The player wins the game at Ante x instead of Ante 8.
- `{id = "extra_hand_money_scaling", value = x}` - Money from extra Hands at the end of a round will be multiplied by x, rounded down (i.e. $1.9 becomes $1 flat)
- `{id = "money_total_scaling", value = x}` - Total money accumulated at the end of a round is multiplied by x, rounded to nearest dollar.

## Example Challenges

Example Challenges have been moved to a separate Mod file, ChallengerDeepExamples.
This file will be updated and uploaded in a separate zip to the main mod.
