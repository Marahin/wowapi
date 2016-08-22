# WoWAPI

# What this is
**WoWAPI** project is created by [Jasiek ~marahin Matusz](https://marahin.pl/) with it's source on [git.3lab.re](https://git.3lab.re/marahin/wowapi), licensed under MIT license.

This is a Ruby library, so called _gem_. It is targetted to be used in Ruby scripts, [Rails](http://rubyonrails.org/), [Sinatra](http://www.sinatrarb.com/) or anything that uses Ruby.

This project began during a search for an easy-to-use gem that allows to access Blizzard's World of Warcraft Community API with ease. It is based on (now deprecated) [Battlenet GEM](https://github.com/BinaryMuse/battlenet) by [BinaryMuse](https://github.com/BinaryMuse), however it focuses purely on World of Warcraft.

## What does it do?

**WoWAPI** is a library that's dependant on _open-uri_ and _json_. Both are built-in Ruby libraries. Nothing more than that, just plain Ruby.

## How do I use this?

```
require 'wowapi'

api = Wowapi.new do |config|
  config.public_key   = 'your-public-apikey'
  # config.secret_Key = 'optional-secret-key'
  # config.region     = :us # (optional)
end

api.guild('Argent Dawn', 'The Aspects', :members, :news)
```

# Support & requirements

## API authentication
In order to access World of Warcraft's API you need your API key. For most actions (guild info for example) you only need the public key. Nonetheless, both of these you can aquire at [Battle.net Developer Portal](https://dev.battle.net/).
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