# WoWAPI
[![Gem Version](https://badge.fury.io/rb/wowapi.svg)](https://badge.fury.io/rb/wowapi)  

**EARLY STAGE DEVELOPMENT. HERE BE DRAGONS**  
However, you are welcome to contribute and/or criticise (and/or) show me the way to handle things.
 
# What this is
**WoWAPI** project is created by [Jasiek ~marahin Matusz](https://marahin.pl/) with it's source on [git.3lab.re](https://git.3lab.re/marahin/wowapi), licensed under MIT license.

This is a Ruby library, so called _gem_. It is targetted to be used in Ruby scripts, [Rails](http://rubyonrails.org/), [Sinatra](http://www.sinatrarb.com/) or anything that uses Ruby.

This project began during a search for an easy-to-use gem that allows to access Blizzard's World of Warcraft Community API with ease. It is based on (now deprecated) [Battlenet GEM](https://github.com/BinaryMuse/battlenet) by [BinaryMuse](https://github.com/BinaryMuse), however it focuses purely on World of Warcraft.

## What does it do?

It gives you a pretty interface to Blizzard's Community API. 

## How do I use this?

Before you start tinkering, I suggest generating *rDOC* documentation.  
To do so, run `rdoc` in the root directory of Wowapi. Then navigate to doc/index.html in your browser, and voila - you have your offline documentation with all methods, classes and pretty-displayed README.md. 

You may also browse *ri* documentation which installs by default when you install the gem. Just type `ri Wowapi`. 
### Resources

We have different resources for different parts of the API. Each resource can be queried with query fields.
  Currently, everything is returned as a Hash(*)
  
| Resource(s) 	| query fields 	|               	|            	|          	|
|:-----------:	|:------------:	|:-------------:	|:----------:	|:--------:	|
|    Guild   	|     :news    	| :achievements 	| :challenge 	| :members 	|
* temporarily_ - see #1, #2, #3 @ ([git.3lab.re](https://git.3lab.re/marahin/wowapi/issues))


### Examples
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