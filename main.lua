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

    --JOKER FUN

    G.GAME.modifiers.minus_jokers_per_dollar = 0
    G.GAME.modifiers.overflow_perishable = false
    G.GAME.modifiers.overflow_debuff = false

    G.GAME.joker_overflow = false
    
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

                        -- EDITIONS - BASE GAME

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

                        -- BLIND SCALING

                    elseif v.id == 'blind_scaling' then -- multiplies blind requirement by value
                        G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * v.value

                        -- JOKER FUN

                    elseif v.id == 'minus_jokers_per_dollar' then -- -1 joker per value dollar
                        G.GAME.modifiers.minus_jokers_per_dollar = v.value
                    elseif v.id == 'overflow_perishable' then -- if jokers > joker slots, all jokers become perishable
                        G.GAME.modifiers.overflow_perishable = true
                    elseif v.id == 'overflow_debuff' then -- harsher version of last rule
                        G.GAME.modifiers.overflow_debuff = true
                    else
                    end
                    end
                end
            end
        end
    return result
    end
end

local set_edition_ref = Card.set_edition
function Card:set_edition(edition, immediate, silent)
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
    end
    local result = update_ca_ref(self, dt)
    
    return result
end

-- test challenge
--[[SMODS.Challenge{
    loc_txt = "Test",
    key = 'test',
    rules = {
        custom = {{id = 'minus_jokers_per_dollar', value = 5},
                {id = 'overflow_debuff'}
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
-------------------------------------------------
------------MOD CODE END----------------------
