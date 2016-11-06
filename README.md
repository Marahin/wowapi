# WoWAPI
[![Gem Version](https://badge.fury.io/rb/wowapi.svg)](https://badge.fury.io/rb/wowapi)
[![Build Status](https://travis-ci.org/Marahin/wowapi.svg?branch=master)](https://travis-ci.org/Marahin/wowapi)
[![Code Climate](https://codeclimate.com/github/Marahin/wowapi/badges/gpa.svg)](https://codeclimate.com/github/Marahin/wowapi)
[![Dependency Status](https://gemnasium.com/badges/github.com/Marahin/wowapi.svg)](https://gemnasium.com/github.com/Marahin/wowapi)
[![security](https://hakiri.io/github/Marahin/wowapi/master.svg)](https://hakiri.io/github/Marahin/wowapi/master)
[![Inline docs](http://inch-ci.org/github/Marahin/wowapi.svg?branch=master)](http://inch-ci.org/github/Marahin/wowapi)

**EARLY STAGE DEVELOPMENT. HERE BE DRAGONS**  
However, you are welcome to contribute and/or criticise (and/or) show me the way to handle things.
 
# What this is
**WoWAPI** project is created by [Jasiek ~marahin Matusz](https://marahin.pl/) with it's source on [git.3lab.re](https://git.3lab.re/marahin/wowapi), licensed under MIT license.

This is a Ruby library, so called _gem_. It is targetted to be used in Ruby scripts, [Rails](http://rubyonrails.org/), [Sinatra](http://www.sinatrarb.com/) or anything that uses Ruby.

This project began during a search for an easy-to-use gem that allows to access Blizzard's World of Warcraft Community API with ease. It is based on (now deprecated) [Battlenet GEM](https://github.com/BinaryMuse/battlenet) by [BinaryMuse](https://github.com/BinaryMuse), however it focuses purely on World of Warcraft.

## What does it do?

It gives you a pretty interface to Blizzard's Community API. 

## How do I use this?

### Installation

#### Rubygems
 This gem is available on Rubygems: https://rubygems.org/gems/wowapi
 ```
 gem install wowapi
 ```
 And everything should work just fine. For a list of compatible (tested) Rubies, see 'Support' at the bottom.
#### Download & build yourself
 You can also build it from scratch.
 * clone the repo:
 ```
 git clone https://git.3lab.re/marahin/wowapi.git
 ```
 * enter the directory:
 ```
 cd wowapi
 ```
 * run bundler, so you have everything you need already:
 ```
 bundle install
 ```
 * build gem:
 ```
 gem build wowapi.gemspec
 ```
 * if build passes, install it from your local environment:
 ```
 gem install --local wowapi**.gem
 ```
### Resources, query fields and fields

**<< DUE TO FAST DEVELOPMENT CYCLE THIS PART OF DOCUMENTATION IS LACKING. >>**  

We have different **resources** for different parts of the API. Each **resource** can be queried with **query fields**, and after being queried, object has **fields**.

Every **resource** is called as a method on `Wowapi` Object. Please note that resource is **not** a field.
**Query field** can be defined as "what do we exactly want to know about the resource". See following example:
  
  
```
api.guild('Argent Dawn', 'The Aspects') ## this returns only basic Guild info (guild resource with no query fields)

api.guild('Argent Dawn', 'The Aspects', :news, :members) ## whereas this returns guild info AND members array (guild resource with :members, :news query fields)
```

In above example we passed `:news` and `:members` **query fields** for the Guild **resource**. However, `:members` is a special example, because **not only this is a query field, but also a special field**.  
**Special field** is a **field** that is additionally processed. See, in case of `:members` Blizzard returns JSON array that contains some Character data (an array of Characters that are members of the Guild). However, Wowapi is so cool that every record inside becomes a `CharacterClass` object.
In different words, **special fields contain A PROCESSED BLIZZARD RESPONSE**. These are enhanced and can be managed Ruby-way.

**SPECIAL FIELD DOESN'T NECESSARILY HAVE TO BE A QUERY FIELD. SEE `.avatar` ON `CharacterClass`**
**SPECIAL FIELDS ARE MENTIONED ONLY BECAUSE PART OF THE API IS NOT YET FULLY COVERED. SOME "FIELDS" THAT ARE NOT _SPECIAL_ MAY CONTAIN RAW JSON RESPONSE.**  

#### Query fields table

| Resource(s) 	| query fields 	|               	|            	|          	|
|:-----------:	|:------------:	|:-------------:	|:----------:	|:--------:	|
|    .guild   	|     :news    	| :achievements 	| :challenge 	| :members 	|
|    .character |

#### Special fields table

|    Resource   |     field     | special field?| description                                                   |
| :-----------: | :-----------: | :-----------: | :-----------:                                                 |
|     guild     |  .members     |     yes       |Becomes array of `CharacterClass` objects                      |
|   character   |  .avatar      |     yes       |Returns ready-to-render link for avatar image of the character.|


### Examples

#### Rails
* Create initializer called `wowapi.rb` in your Rails app's `config/initializers` directory,
* fill it with following:


```
require 'wowapi'

## Set region (defaults to :eu)
## Wowapi.region = :us

## Create Api variable usable ANYWHERE in your Rails app
::Api = Wowapi.new do |config|
  config.public_key = 'your-public-apikey'
  ## config.secret_key = 'your-secret-key'
end

## Create your Guild name variable, usually GuildName or GuildNameApi that holds information about your guild.  
## ::YourGuildName = Api.guild('Realm', 'Guild name', :field1, :field2)
::Aspects = Api.guild('Argent Dawn', 'The Aspects', :members, :news)
```

Now, in any controller / view you can do:

* controllers/pages_controller.rb

  
```
class PagesController < ApplicationController
  def index
    @news = Aspects.news
  end
end

```

* in views:

  
```
@news.last(7).each do |news|
    ... 
end
```


#### Plain ruby
You can use simple variables. For more advanced usage with global variables and namespaces, see above (Rails usage).
```
require 'wowapi'

api = Wowapi.new do |config|
  config.public_key   = 'your-public-apikey'
  # config.secret_Key = 'optional-secret-key'
end

# returns guild profile
guild = api.guild('Argent Dawn', 'The Aspects')  

# returns guild profile & members list
guild = api.guild('Argent Dawn', 'The Aspects', :members) 
guild.members # Array of CharacterClass objects

# returns guild profile, members list & news
guild = api.guild('Argent Dawn', 'The Aspects', :members, :news)
guild.news # array of Hashes containing news
 
# returns character profile
character = api.character('Argent Dawn', 'Marahin')

```


You can easily combine fields. 
# Support & requirements

## API authentication
In order to access World of Warcraft's API you need your API key. For most actions (guild info for example) you only need the public key. Nonetheless, both of these you can aquire at [Battle.net Developer Portal](https://dev.battle.net/).

If you do not provide public (and/or private key) you will most likely step upon `Wowapi::NoCredentialsException` error. 
Make sure your Wowapi instance contains `public_key` (and/or, if necessary - `secret_key`).

If you fail to authenticate, you will most likely step upon `Wowapi::AuthException` error. This means either your credentials are invalid, or something is wrong with Blizzard services. Nonetheless, you have a problem.

## Ruby
Everything >= 2.0.0 should work just fine. Below you can see a table with different MRI Ruby versions which we tested the gem on:

| Ruby (MRI) | Does it work?                                   |
|------------|-------------------------------------------------|
| 1.9.3      | **NO**. Some flow in Object class is different. |
| 2.0.0      | Hell **YES**.                                   |
| 2.2.3      | Sure, **YES**.                                  |
| 2.3.0      | Just fine, **YES**.                             |
| 2.3.1      | **YES**, uh huh.                                |

As it's early stage development, and as it's stated in the LICENSE, I do not guarantee that any other Rubies will make allow you to use this library.
Hell, I do not guarantee _anything_.

## Documentation
Before you start tinkering, I suggest generating **rDOC** documentation.  
To do so, run `rdoc` in the root directory of Wowapi. Then navigate to doc/index.html in your browser, and voila - you have your offline documentation with all methods, classes and pretty-displayed README.md. 

You may also browse **ri** documentation which installs by default when you install the gem. Just type `ri Wowapi`. 

**But it should work just fine on Rubies >= 2.0.0.**

## Regions
### Region defaults to :eu!
List of currently supported regions:
- Europe (**_:eu_**)
- United States (**_:us_**)

API region can be changed by passing proper symbol:

```
## Change through Wowapi class variable,
Wowapi.region = :us

## Change through Wowapi object
myvar = Wowapi.new{ |c| ... }
myvar.region = :us

```

Keep in mind that this is completely optional, and default is **_:eu_**.

## Contributing
I'm a single developer here. I'm working student. This is an introduction.

### IRC
`#wowapi` at Freenode 
### Bugtracking / I have a question / I have a problem
Every problem / feature / bug / anything that concerns you should find place in Issues tab up top.
As soon as you get your answer, the issue will also be labeled. 

### I want to help
If you want to help, make sure you understand how the library works. Ask me, don't feel shy. As a beginner, making me know that someone actually uses it will make my heart warm.  
If you already know what you're doing, and you know how to fix the bug / make something work better / improve the library, create a pull request. 

Or either create an issue with the code, explaining how it works and why is it better / how does it fix stuff. I don't really care, whatever is easier / friendlier for you. 
## Games
**There is no plan of supporting anything but World of Warcraft. Sorry.**  
Unless money is involved. :^)