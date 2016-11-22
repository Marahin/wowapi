# WoWapi  
[![Gem Version](https://badge.fury.io/rb/wowapi.svg)](https://badge.fury.io/rb/wowapi)
[![Build Status](https://travis-ci.org/Marahin/wowapi.svg?branch=master)](https://travis-ci.org/Marahin/wowapi)
[![Code Climate](https://codeclimate.com/github/Marahin/wowapi/badges/gpa.svg)](https://codeclimate.com/github/Marahin/wowapi)
[![Dependency Status](https://gemnasium.com/badges/github.com/Marahin/wowapi.svg)](https://gemnasium.com/github.com/Marahin/wowapi)
[![security](https://hakiri.io/github/Marahin/wowapi/master.svg)](https://hakiri.io/github/Marahin/wowapi/master)
[![Inline docs](https://inch-ci.org/github/Marahin/wowapi.svg?branch=master)](https://inch-ci.org/github/Marahin/wowapi)

World of Warcraft API gem.  
This gem is intended to help developers easily access [Blizzards' Community API](https://dev.battle.net/) section of World of Warcraft.  

## Getting Started

### Prerequisites

A [supported, working version of Ruby](#supported-rubies).

### Installing

You can obtain Wowapi in two ways:

- [using Rubygems](#rubygems),
- [building yourself](#build-yourself).

#### Rubygems

```
gem install wowapi
```

#### Build yourself  

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

## Examples

### Rails  

**Bear in mind this is example code.**  

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

### Plain Ruby

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
## Deployment

**Nothing additional is required**. Bear in mind that Wowapi only download & interprets data, but it **does not provide any kind of persistent storage**.  
As an author I use this gem to develop [my guild website](http://aspects.pl), where I use [nginx](https://www.nginx.com/) as an reverse proxy to [puma](https://github.com/puma/puma) instance with [Rails](http://rubyonrails.org/) app. I use [redis](http://redis.io/) to store Wowapi data and [Clockwork](https://rubygems.org/gems/clockwork) queue, that is maintaining work of [Sidekiq](https://github.com/mperham/sidekiq) worker that periodically downloads data using Wowapi.

### Supported Rubies

Everything >= 2.0.0 should work just fine. Below you can see a table with different MRI Ruby versions which we tested the gem on:

| Ruby (MRI) | Does it work? |
|------------|---------------|
| 1.9.3      |     **No**    |
| 2.0.0      |     Yes       |
| 2.2.0      |     Yes       |
| 2.2.3      |     Yes       |
| 2.3.0      |     Yes       |
| 2.3.1      |     Yes       |
| jruby*     |     Yes       |

 
## Built With

We are using [Travis CI](./src/master/.travis.yml) to test each commit against [Supported Rubies](#supported-rubies).
## Contributing

**Bugs**: either drop an issue [here](https://git.3lab.re/Marahin/wowapi/issues) or see IRC below  
**IRC**: `#wowapi` on Freenode ([click here to chat now](https://webchat.freenode.net/?nick=WowapiUser&channels=#wowapi))  

I have a problem / want to help:
* contact us through `#wowapi` on Freenode (or creator directly - `me@marahin.pl`),
* if your idea / bugfix / change is approved, send a pull request or provide a link to your fork with it fixed,
* you will be mentioned below in the [Authors section](#authors)

## Versioning

**SINCE 1.0.0** we use [SemVer](http://semver.org/) for versioning. For the versions available, see [Releases](https://git.3lab.re/Marahin/wowapi/releases) or [RubyGems](https://rubygems.org/gems/wowapi/versions).

## Authors

* **Jan "marahin" Matusz** - *founder, creator, developer* - [marahin](https://marahin.pl/en/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## Acknowledgments

* this is a successor of [BinaryMuse's battlenet gem](https://github.com/BinaryMuse/battlenet) - some of the meta-code is his
* this is a in-dev project started, maintained and developed by a student
* we are using GitHub as a MIRROR. Main source is located at [git.3lab.re/Marahin/wowapi](https://git.3lab.re/Marahin/wowapi)
