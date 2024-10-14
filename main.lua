--- STEAMODDED HEADER
--- MOD_NAME: Challenger Deep
--- MOD_ID: ChDp
--- MOD_AUTHOR: [Opal]
--- MOD_DESCRIPTION: Adds some Challenge rules into the game, such as banning Editions.
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]
--- PREFIX: chdp
----------------------------------------------
------------MOD CODE ------------------------- 

local Backapply_to_run_Ref = Back.apply_to_run
function Back:apply_to_run()
    Backapply_to_run_Ref(self)

    --ALL EDITIONS

    G.GAME.modifiers.no_edition_cards = false --no edition cards
    G.GAME.modifiers.no_edition_jokers = false --no edition jokers

    --BASE GAME EDITIONS

    G.GAME.modifiers.no_foil_cards = false --no foil cards 
    G.GAME.modifiers.no_foil_jokers = false --no foil jokers

    G.GAME.modifiers.no_holo_cards = false --no holo cards 
    G.GAME.modifiers.no_holo_jokers = false --no holo jokers

    G.GAME.modifiers.no_negative_jokers = false --no negative jokers

    G.GAME.modifiers.no_polychrome_cards = false --no polychrome cards 
    G.GAME.modifiers.no_polychrome_jokers = false --no polychrome jokers

    --BUNCO EDITIONS

    G.GAME.modifiers.no_fluorescent_cards = false --no fluorescent cards 
    G.GAME.modifiers.no_fluorescent_jokers = false --no fluorescent jokers

    G.GAME.modifiers.no_glitter_cards = false --no glitter cards 
    G.GAME.modifiers.no_glitter_jokers = false --no glitter jokers

    --BLINDS

    G.GAME.modifiers.money_scaling = 1
    G.GAME.modifiers.money_total_scaling = 1

    --JOKER FUN

    G.GAME.modifiers.minus_jokers_per_dollar = 0
    G.GAME.modifiers.jokers_per_dollar = 0
    G.GAME.modifiers.overflow_perishable = false
    G.GAME.modifiers.overflow_debuff = false
    G.GAME.modifiers.overflow_debuff_one = false

    G.GAME.joker_overflow = false
    G.GAME.joker_overflow_size = 0
    G.GAME.old_joker_overflow_size = 0

    G.GAME.modifiers.hand_per_joker = false
    G.GAME.modifiers.minus_discard_per_joker = false

    --STICKERS

    G.GAME.modifiers.all_rental_jokers = false
    G.GAME.modifiers.rentals_keep_price = false

    --SHOP

    G.GAME.modifiers.no_vouchers = false
end

  local start_run_ref = Game.start_run
function Game:start_run(args)
    local result = start_run_ref(self, args)
    if not saveTable then
        if args.challenge then
            local _ch = args.challenge
            if _ch.rules then
                if _ch.rules.custom then
                    for k, v in ipairs(_ch.rules.custom)do

                        -- ALL EDITIONS

                    if v.id == 'no_editions' then
                        G.GAME.modifiers.no_edition_cards = true
                        G.GAME.modifiers.no_edition_jokers = true
                    elseif v.id == 'no_edition_cards' then
                        G.GAME.modifiers.no_edition_cards = true
                    elseif v.id == 'no_edition_jokers' then
                        G.GAME.modifiers.no_edition_jokers = true

                        -- EDITIONS - BASE GAME (note: it is recommended to ban corresponding tags for editions)

                    elseif v.id == 'no_foils' then --removes foil edition from all cards
                        G.GAME.modifiers.no_foil_cards = true
                        G.GAME.modifiers.no_foil_jokers = true
                    elseif v.id == 'no_foil_cards' then --removes foil edition from playing cards
                        G.GAME.modifiers.no_foil_cards = true
                    elseif v.id == 'no_foil_jokers' then --removes foil edition from jokers
                        G.GAME.modifiers.no_foil_jokers = true

                    elseif v.id == 'no_holos' then --removes holo edition from all cards
                        G.GAME.modifiers.no_holo_cards = true
                        G.GAME.modifiers.no_holo_jokers = true
                    elseif v.id == 'no_holo_cards' then --removes holo edition from playing cards
                        G.GAME.modifiers.no_holo_cards = true
                    elseif v.id == 'no_holo_jokers' then --removes holo edition from jokers
                        G.GAME.modifiers.no_holo_jokers = true

                    elseif v.id == 'no_polychromes' then --removes polychrome edition from all cards
                        G.GAME.modifiers.no_polychrome_cards = true
                        G.GAME.modifiers.no_polychrome_jokers = true
                    elseif v.id == 'no_polychrome_cards' then --removes polychrome edition from playing cards
                        G.GAME.modifiers.no_polychrome_cards = true
                    elseif v.id == 'no_polychrome_jokers' then --removes polychrome edition from jokers
                        G.GAME.modifiers.no_polychrome_jokers = true

                    elseif v.id == 'no_negative_jokers' then --removes negative edition from jokers
                        G.GAME.modifiers.no_negative_jokers = true

                        -- EDITIONS - BUNCO

                    elseif v.id == 'no_fluorescents' then --removes fluorescent edition from all cards
                        G.GAME.modifiers.no_fluorescent_cards = true
                        G.GAME.modifiers.no_fluorescent_jokers = true
                    elseif v.id == 'no_fluorescent_cards' then --removes fluorescent edition from playing cards
                        G.GAME.modifiers.no_fluorescent_cards = true
                    elseif v.id == 'no_fluorescent_jokers' then --removes fluorescent edition from jokers
                        G.GAME.modifiers.no_fluorescent_jokers = true
                    
                    elseif v.id == 'no_glitters' then --removes glitter edition from all cards
                        G.GAME.modifiers.no_glitter_cards = true
                        G.GAME.modifiers.no_glitter_jokers = true
                    elseif v.id == 'no_glitter_cards' then --removes glitter edition from playing cards
                        G.GAME.modifiers.no_glitter_cards = true
                    elseif v.id == 'no_glitter_jokers' then --removes glitter edition from jokers
                        G.GAME.modifiers.no_glitter_jokers = true

                        -- BLINDS

                    elseif v.id == 'blind_scaling' then -- multiplies blind requirement by value
                        G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * v.value
                    elseif v.id == 'money_scaling' then -- multiplies blind requirement by value
                        G.GAME.modifiers.money_scaling = v.value

                        -- JOKER FUN

                    elseif v.id == 'minus_jokers_per_dollar' then -- -1 joker per value dollar
                        G.GAME.modifiers.minus_jokers_per_dollar = v.value
                    elseif v.id == 'jokers_per_dollar' then -- +1 joker per value dollar
                        G.GAME.modifiers.jokers_per_dollar = v.value

                    elseif v.id == 'overflow_perishable' then -- if jokers > joker slots, all jokers become perishable
                        G.GAME.modifiers.overflow_perishable = true
                    elseif v.id == 'overflow_debuff' then -- harsher version of last rule
                        G.GAME.modifiers.overflow_debuff = true
                    elseif v.id == 'overflow_debuff_one' then --debuffs one Joker for each
                        G.GAME.modifiers.overflow_debuff_one = true

                    elseif v.id == 'hand_per_joker' then --gain hand per joker
                        G.GAME.modifiers.hand_per_joker = true
                    elseif v.id == 'minus_discard_per_joker' then --gain hand per joker
                        G.GAME.modifiers.minus_discard_per_joker = true

                        -- STICKERS

                    elseif v.id == 'enable_eternal_jokers' then --these 3 just do the same thing from stakes
                        G.GAME.modifiers.enable_eternals_in_shop = true
                    elseif v.id == 'enable_perishable_jokers' then
                        G.GAME.modifiers.enable_perishables_in_shop = true
                    elseif v.id == 'enable_rental_jokers' then
                        G.GAME.modifiers.enable_rentals_in_shop = true

                    elseif v.id == 'all_rental_jokers' then --every joker is rental
                        G.GAME.modifiers.all_rental_jokers = true
                    elseif v.id == 'rentals_keep_price' then --every joker is rental
                        G.GAME.modifiers.rentals_keep_price = true

                    elseif v.id == 'rental_rate' then --sets rental rate
                        G.GAME.rental_rate = v.value
                    elseif v.id == 'perishable_rounds' then --sets perishable rounds
                        G.GAME.perishable_rounds = v.value
                    
                        -- SHOP STUFF

                    elseif v.id == 'no_vouchers' then --no vouchers appear in shop (NOTE: BAN VOUCHER TAG)
                        G.GAME.modifiers.no_vouchers = true

                        -- MISCELLANEOUS

                    elseif v.id == 'win_ante' then --sets win ante
                        G.GAME.win_ante = v.value
                    elseif v.id == 'extra_hand_money_scaling' then --multiplies money from extra hands by value
                        G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 1) * v.value
                    else
                    end
                    end
                end
            end
        end
    end
    if G.GAME.modifiers.no_vouchers then
        G.GAME.current_round.voucher = nil
    end
    return result
end

local get_next_voucher_key_ref = get_next_voucher_key
function get_next_voucher_key(_from_tag)
    if G.GAME.modifiers.no_vouchers == true then
        return nil
    else
        local result = get_next_voucher_key_ref(_from_tag)
        return result
    end
    
end

local set_edition_ref = Card.set_edition
function Card:set_edition(edition, immediate, silent)
    if G.GAME.modifiers.all_rental_jokers == true then
        self:set_rental(true)
    end
    local run = true

    if edition then
    if G.GAME.modifiers.no_edition_jokers and self.ability.set == "Joker" then
        run = false
    end
    if G.GAME.modifiers.no_edition_cards and not(self.ability.set == "Joker") then
        run = false
    end

    if (edition == "e_foil" or edition.foil) and G.GAME.modifiers.no_foil_jokers and self.ability.set == "Joker" then
        run = false
    end
    if (edition == "e_foil" or edition.foil) and G.GAME.modifiers.no_foil_cards and not(self.ability.set == "Joker") then
        run = false
    end

    if (edition == "e_holo" or edition.holo) and G.GAME.modifiers.no_holo_jokers and self.ability.set == "Joker" then
        run = false
    end
    if (edition == "e_holo" or edition.holo) and G.GAME.modifiers.no_holo_cards and not(self.ability.set == "Joker") then
        run = false
    end

    if (edition == "e_polychrome" or edition.polychrome) and G.GAME.modifiers.no_polychrome_jokers and self.ability.set == "Joker" then
        run = false
    end
    if (edition == "e_polychrome" or edition.polychrome) and G.GAME.modifiers.no_polychrome_cards and not(self.ability.set == "Joker") then
        run = false
    end
    
    if (edition == "e_negative" or edition.negative) and G.GAME.modifiers.no_negative_jokers and self.ability.set == "Joker" then
        run = false
    end
    if (SMODS.Mods.Bunco or {}).can_load then
        if (edition == "e_bunc_fluorescent" or edition.bunc_fluorescent) and G.GAME.modifiers.no_fluorescent_jokers and self.ability.set == "Joker" then
            run = false
        end
        if (edition == "e_bunc_fluorescent" or edition.bunc_fluorescent) and G.GAME.modifiers.no_fluorescent_cards and not(self.ability.set == "Joker") then
            run = false
        end

        if (edition == "e_bunc_glitter" or edition.bunc_glitter) and G.GAME.modifiers.no_glitter_jokers and self.ability.set == "Joker" then
            run = false
        end
        if (edition == "e_bunc_glitter" or edition.bunc_glitter) and G.GAME.modifiers.no_glitter_cards and not(self.ability.set == "Joker") then
            run = false
        end
    end
    if silent == true then
        run = true
    end
    if run then
        return set_edition_ref(self, edition, immediate, silent)
    else
        play_sound('tarot2', 0.76, 0.4)
        play_sound('tarot2', 1, 0.4)
        self:juice_up(0.3,0.5)
    end
end
end

local update_ca_ref = CardArea.update
function CardArea:update(dt)
    if self == G.hand then
        if G.GAME.modifiers.minus_jokers_per_dollar then
        if G.GAME.modifiers.minus_jokers_per_dollar > 0 then
            self.config.last_poll_size_jk = self.config.last_poll_size_jk or 0
            if math.floor(G.GAME.dollars/G.GAME.modifiers.minus_jokers_per_dollar) ~= self.config.last_poll_size_jk then
                if math.floor(G.GAME.dollars/G.GAME.modifiers.minus_jokers_per_dollar) <= G.GAME.starting_params.joker_slots then
                    G.jokers.config.card_limit = G.GAME.starting_params.joker_slots - math.floor(G.GAME.dollars/G.GAME.modifiers.minus_jokers_per_dollar)
                else
                    G.jokers.config.card_limit = 0
                end
                self.config.last_poll_size_jk = math.floor(G.GAME.dollars/G.GAME.modifiers.minus_jokers_per_dollar)
            end
        end
        end
        if G.GAME.modifiers.jokers_per_dollar then
            if G.GAME.modifiers.jokers_per_dollar > 0 then
            self.config.last_poll_size_jk = self.config.last_poll_size_jk or 0
            if math.floor(G.GAME.dollars/G.GAME.modifiers.jokers_per_dollar) ~= self.config.last_poll_size_jk then
                if math.floor(G.GAME.dollars/G.GAME.modifiers.jokers_per_dollar) <= G.GAME.starting_params.joker_slots then
                    G.jokers.config.card_limit = G.GAME.starting_params.joker_slots + math.floor(G.GAME.dollars/G.GAME.modifiers.jokers_per_dollar)
                else
                    G.jokers.config.card_limit = 0
                end
                self.config.last_poll_size_jk = math.floor(G.GAME.dollars/G.GAME.modifiers.jokers_per_dollar)
                if G.jokers.config.card_limit < 0 then
                    G.jokers.config.card_limit = 0
                end
            end
        end
        end
        local overflow = #G.jokers.cards - G.jokers.config.card_limit
        if #G.jokers.cards > G.jokers.config.card_limit then
            G.GAME.joker_overflow = true --jokers are overflowing
        else
            G.GAME.joker_overflow = false --jokers are NOT overflowing
        end
        if G.GAME.modifiers.overflow_perishable then
            if G.GAME.joker_overflow == true then
                for k, v in ipairs(G.jokers.cards) do
                    if not v.ability.perishable then
                        v.ability.temp_perishable = true
                        v:set_perishable()
                    end
                end
            else
                for k, v in ipairs(G.jokers.cards) do
                    if v.ability.temp_perishable == true then
                        v.ability.temp_perishable = false
                        v.ability.perishable = false
                    end
                end
            end
        end
        if G.GAME.modifiers.overflow_debuff then
            if G.GAME.joker_overflow == true then
                for k, v in ipairs(G.jokers.cards) do
                    if not v.debuff then
                        v.ability.temp_debuff = true
                        v.debuff = true
                    end
                end
            else
                for k, v in ipairs(G.jokers.cards) do
                        if v.ability.temp_debuff then
                        v.ability.temp_debuff = false
                        v.debuff = false
                        end
                end
            end
        end
        if G.GAME.modifiers.overflow_debuff_one then
            local jokers = {}
            local debuffed_jokers = {}
            local debuff = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].debuff or G.jokers.cards[i].ability.debuff_rule == true then 
                    debuffed_jokers[#debuffed_jokers+1] = G.jokers.cards[i]
                    debuff = debuff + 1 
                    G.jokers.cards[i]:set_debuff(true)
                end
                if not G.jokers.cards[i].debuff then
                    jokers[#jokers+1] = G.jokers.cards[i]
                end
            end
            if overflow > debuff and #jokers > 0 then
            for i = 0, overflow - debuff do
                local card = pseudorandom_element(jokers)
                    card.ability.debuff_rule = true
                    card:set_debuff(true)
            end
            elseif overflow < debuff and #debuffed_jokers > 0 then
                for i = 0, debuff - overflow do
                    local card = pseudorandom_element(debuffed_jokers)
                    card.ability.debuff_rule = false
                    card:set_debuff(false)
                end
            end
        end
        if G.GAME.modifiers.hand_per_joker then
            local base = G.GAME.starting_params.hands
            G.GAME.round_resets.hands = base + #G.jokers.cards
            if (SMODS.Mods.BANANA or {}).can_load then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands - G.GAME.voodooheart
            end
        end
        if G.GAME.modifiers.minus_discard_per_joker then
            local base = G.GAME.starting_params.discards
            G.GAME.round_resets.discards = base - #G.jokers.cards
            if (SMODS.Mods.BANANA or {}).can_load then
                G.GAME.round_resets.discards = G.GAME.round_resets.discards - G.GAME.mirrorbroken
            end
        end
    end
    local result = update_ca_ref(self, dt)
    
    return result
end

local set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    local result = set_blind_ref(self, blind, reset, silent)
    if G.GAME.modifiers.money_scaling then
    G.GAME.blind.dollars = math.floor(G.GAME.blind.dollars * G.GAME.modifiers.money_scaling)
    end
    return result
end

local debuff_card_ref = Blind.debuff_card
function Blind:debuff_card(card, from_blind)
    local result = debuff_card_ref(self,card,from_blind)
    if card.ability.debuff_rule then
        card:set_debuff(true)
    end
    return result
end

function Card:set_rental(_rental)
    self.ability.rental = _rental
    if not G.GAME.modifiers.rentals_keep_price then
        self:set_cost()
    end
end

-- test challenge
--[[SMODS.Challenge{
    loc_txt = "Test",
    key = 'test',
    rules = {
        custom = {{id = 'rentals_keep_price'},
                {id = 'all_rental_jokers'},
    },
        modifiers = {},
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {}
    },
    }

    SMODS.Challenge{
        loc_txt = "Test II",
        key = 'test2',
        rules = {
            custom = {{id = 'all_rental_jokers'},
        },
            modifiers = {},
        },
        jokers = {
        },
        restrictions = {
            banned_cards = {},
            banned_tags = {},
            banned_other = {}
        },
        }]]--

----------------------------------------------
------------MOD CODE END----------------------