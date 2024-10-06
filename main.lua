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

-- test challenge
--[[SMODS.Challenge{
    loc_txt = "Test",
    key = 'test',
    rules = {
        custom = {{id = 'no_editions'},
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