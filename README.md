# Challenger Deep

This is a Balatro mod that adds several rules that can be added to Challenges, for example banning Editions. Also a Sticker now!

## Rule List

Below is a comprehensive list of rules added by the mod. The string in each entry should replace "example" in `{id = "example"}`.
For rules with a value variable, the whole item will be typed out, such as `{id = "example", value = x}`, where the required input for x will be specified.

### Banning Editions

#### Every Edition

- `"no_editions"` - Removes every edition from every card.
- `"no_edition_jokers"` - Removes editions from Jokers.
- `"no_edition_cards"` - Removes editions from Playing Cards.

#### Specific Editions

Supported editions are as follows:
Base editions: `foil`, `holo`, `polychrome`, `negative` (Jokers only)
Bunco editions: `fluorescent`, `glitter`
Cryptid editions: `mosaic`, `glitched`, `oversat`, `gold`, `glass`, `blur`, `astral`, `m`

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

- `"enable_(sticker)_jokers"` - Jokers can have the specified Sticker.
- `"all_(sticker)_jokers"` - All Jokers will have the specified Sticker. (For Eternal, use base game `"all_eternal"`)

Possible stickers for the previous two rules:
Base game: `eternal`, `rental`, `perishable`
Challenger Deep: `singular`
Bunco: `scattering`, `reactive`, `hindered`
  
- `"rentals_keep_price"` - Rental Jokers will retain their price.
- `{id = "rental_rate", value = x}` - Rental Jokers will have their rate set to x dollars. At the end of a round, for each Rental Joker, x dollars will be deducted from the player.
- `{id = "rental_rate_increase", value = x}` - Rental rate increases by x every Ante.
- `{id = "rental_rate_increase_all", value = x}` - Rental rate increases by x every round.
- `{id = "perishable_rounds", value = x}` - Perishable Jokers will be debuffed after x rounds.

### Shop

- `{id = "reroll_cost_increase", value = x}` - Successive rerolls cost $x more each (e.g. when this is 1 (the default value), reroll 1 costs $5, reroll 2 costs $6 etc)
- `"no_vouchers"` - Vouchers do not appear.

- `{id = "all_shop_scaling", value = x}` - The price of every item in the shop is multiplied by x
- `{id = "shop_scaling_round_increase", value = x}` - `all_shop_scaling` increases by x every round
- `{id = "shop_scaling_ante_increase", value = x}` - `all_shop_scaling` increases by x every Ante

### Chaos Engine

- `"chaos_engine"` - Enables a random Rule every Ante.
- `"chaos_engine_all"` - Enables a random Rule every Round.

#### Chaos Rules
At the beginning of a Chaos Engine run, the following rules are possible:

- `no_vouchers`
- `enable_eternal_jokers` (or `all_eternal` if this rule has been used)
- `enable_rental_jokers` (or `all_rental_jokers` and `rental_rate` if this rule has been used)
- `enable_perishable_jokers` (or `all_perishable_jokers` and `perishable_rounds` if this rule has been used)
- `{id = 'win_ante'}` (Value is set to a random integer between 6 and 12.)
- `{id = 'blind_scaling'}` (Value is set to a random number between 0.5 and 4.)
- `{id = 'all_shop_scaling'}` (Value is set to a random number between 0.75 and 2.75.)
- `{id = 'money_total_scaling'}` (Value is set to a random number between 0.25 and 1.25, rounded to the nearest 0.01.)
- At any given time, the Chaos Engine will have an `anaglyph` rule, set to a random Tag (including Bunco and Cryptid tags, if enabled)
- At any given time, the Chaos Engine has one `no_(EDITION)s`, one `no_(EDITION)_cards` and one `no_(EDITION)_jokers` rule

### Miscellaneous Rules

- `{id = "win_ante", value = x}` - The player wins the game at Ante x instead of Ante 8.
- `{id = "extra_hand_money_scaling", value = x}` - Money from extra Hands at the end of a round will be multiplied by x, rounded down (i.e. $1.9 becomes $1 flat)

- `{id = "money_total_scaling", value = x}` - Total money accumulated at the end of a round is multiplied by x, rounded to nearest dollar.
- `{id = "mts_scaling", value = x}` - The money multiplier `money_total_scaling` has x added to it every Ante.

- - `{id = 'anaglyph', value = localize{type = 'name_text', set = 'Tag', key = 'tag_x', nodes = {}}, tag = 'x'}` - Creates a Tag with the key `tag_x` every round.

## Sticker

Singular Jokers cannot be duplicated.

## Example Challenges

Example Challenges have been moved to a separate Mod file, ChallengerDeepExamples.
This file will be updated and uploaded in a separate zip to the main mod.
