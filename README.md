# WoWAPI
**EARLY STAGE DEVELOPMENT. HERE BE DRAGONS**
However, you are welcome to contribute and/or criticise (and/or) show me the way to handle things.
 
# What this is
**WoWAPI** project is created by [Jasiek ~marahin Matusz](https://marahin.pl/) with it's source on [git.3lab.re](https://git.3lab.re/marahin/wowapi), licensed under MIT license.

This is a Ruby library, so called _gem_. It is targetted to be used in Ruby scripts, [Rails](http://rubyonrails.org/), [Sinatra](http://www.sinatrarb.com/) or anything that uses Ruby.

This project began during a search for an easy-to-use gem that allows to access Blizzard's World of Warcraft Community API with ease. It is based on (now deprecated) [Battlenet GEM](https://github.com/BinaryMuse/battlenet) by [BinaryMuse](https://github.com/BinaryMuse), however it focuses purely on World of Warcraft.

## What does it do?

**WoWAPI** is a library that's dependant on _open-uri_ and _json_. Both are built-in Ruby libraries. Nothing more than that, just plain Ruby.

## How do I use this?


### Guilds

Guilds can take couple of arguments to query: 

* news
* achievements
* challenge
* members

Each of these will expand (temporarily*) returned Hash.
 
 _* temporarily_ - in the end-stage of development I dream of having a `GuildClass` which would have a standardized structure. For now it just returns a `JSON.parse(obj)`, which is a simple `Hash`.
 Please keep in mind that I am a working student. (:

```
require 'wowapi'

api = Wowapi.new do |config|
  config.public_key   = 'your-public-apikey'
  # config.secret_Key = 'optional-secret-key'
  # config.region     = :us # (optional)
end

api.guild('Argent Dawn', 'The Aspects')
# => {"lastModified"=>1472853622000, "name"=>"The Aspects", "realm"=>"Argent Dawn", "battlegroup"=>"Reckoning / Abrechnung", "level"=>25, "side"=>1, "achievementPoints"=>1590, "emblem"=>{"icon"=>140, "iconColor"=>"ffdfa55a", "iconColorId"=>16, "border"=>1, "borderColor"=>"fff9cc30", "borderColorId"=>16, "backgroundColor"=>"ff232323", "backgroundColorId"=>45}}

```

#### Guild fields

* news ([pastebin](http://d.gimb.us/b/fe26c9f380477d3a0293072385e61cab.txt))

```
irb(main):005:0> api.guild 'Argent Dawn', 'The Aspects', :news
=> {"lastModified"=>1472853622000, "name"=>"The Aspects", "realm"=>"Argent Dawn", "battlegroup"=>"Reckoning / Abrechnung", "level"=>25, "side"=>1, "achievementPoints"=>1590, "emblem"=>{"icon"=>140, "iconColor"=>"ffdfa55a", "iconColorId"=>16, "border"=>1, "borderColor"=>"fff9cc30", "borderColorId"=>16, "backgroundColor"=>"ff232323", "backgroundColorId"=>45}, "news"=>[{"type"=>"itemLoot", "character"=>"Tormenthowl", "timestamp"=>1472858400000, "itemId"=>124325, "context"=>"raid-mythic", "bonusLists"=>[1799, 1502]}, {"type"=>"itemLoot", "character"=>"Tormenthowl", "timestamp"=>1472858400000, "itemId"=>113900, "context"=>"raid-mythic", "bonusLists"=>[567]}, {"type"=>"itemLoot", "character"=>"Humbakos", "timestamp"=>1472857980000, "itemId"=>130132, "context"=>"", "bonusLists"=>[1794, 1735]}, {"type"=>"itemLoot", "character"=>"Seszel", "timestamp"=>1472854680000, "itemId"=>131799, "context"=>"", "bonusLists"=>[1794, 1735]}, {"type"=>"itemLoot", "character"=>"Kurrash", "timestamp"=>1472854500000, "itemId"=>132970, "context"=>"quest-reward", "bonusLists"=>[767, 1734]}, {"type"=>"itemLoot", "character"=>"Greenzog", "timestamp"=>1472853960000, "itemId"=>131921, "context"=>"", "bonusLists"=>[1794, 1735]}, {"type"=>"itemLoot", "character"=>"Humbakos", "timestamp"=>1472853480000, "itemId"=>121660, "context"=>"quest-reward", "bonusLists"=>[768, 1740]}, {"type"=>"itemLoot", "character"=>"Dzidu", "timestamp"=>1472853060000, "itemId"=>138418, "context"=>"", "bonusLists"=>[1794, 1735]}, $$__***<<< A LOT OF DATA ... >>>***__$$ {"type"=>"itemLoot", "character"=>"Olvarus", "timestamp"=>1472248680000, "itemId"=>109970, "context"=>"dungeon-mythic", "bonusLists"=>[43, 642, 643]}, {"type"=>"playerAchievement", "character"=>"Guldav", "timestamp"=>1472247960000, "context"=>"", "bonusLists"=>[], "achievement"=>{"id"=>13, "title"=>"Level 80", "points"=>10, "description"=>"Reach level 80.", "rewardItems"=>[], "icon"=>"achievement_level_80", "criteria"=>[{"id"=>5212, "description"=>"Reach level 80", "orderIndex"=>1, "max"=>80}], "accountWide"=>false, "factionId"=>2}}]}

```

* achievements

(to be filled)

* challenge

(to be filled)

* members

(to be filled)

* __combined__

(to be filled)


You can easily combine fields. 
# Support & requirements

## API authentication
In order to access World of Warcraft's API you need your API key. For most actions (guild info for example) you only need the public key. Nonetheless, both of these you can aquire at [Battle.net Developer Portal](https://dev.battle.net/).

If you do not provide public (and/or private key) you will most likely step upon `Wowapi::NoCredentialsException` error. 
Make sure your Wowapi instance contains `public_key` (and/or, if necessary - `secret_key`).

If you fail to authenticate, you will most likely step upon `Wowapi::AuthException` error. This means either your credentials are invalid, or something is wrong with Blizzard services. Nonetheless, you have a problem.

## Ruby
Currently developed and tested only on 2.3.0, however _any_ Ruby >= 1.9.0 with _open-uri_ and _json_ support should be working properly.
## Regions
### Region defaults to :eu!
List of currently supported regions:
- Europe (**_:eu_**)
- United States (**_:us_**)

API region can be changed by passing proper symbol to the configuration, example:

```
api = Wowapi.new do |config|
  config.region = :us
  ...
end
```

Keep in mind that this is completely optional, and default is **_:eu_**.
## Games
**There is no plan of supporting anything but World of Warcraft. Sorry.**