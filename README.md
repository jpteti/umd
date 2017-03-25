# UMD

This is a wrapper for the [umd.io](http://umd.io) API for data about the University of Maryland, College Park. Currently it's basically just some
niceties through [HTTParty](https://github.com/jnunemaker/httparty). Relying on this right now is a *bad* idea, as it's under development and there
almost certainly will be API-breaking changes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'umd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install umd

## Usage

TODO: Write this up.

## Security details

UMD is cryptographically signed. To be sure the gem you install hasn’t been tampered with:

Add my public key (if you haven’t already) as a trusted certificate

`gem cert --add <(curl -Ls https://raw.github.com/jpteti/umd/master/certs/jpteti.pem)`

`gem install umd -P MediumSecurity`

The MediumSecurity trust profile will verify signed gems, but allow the installation of unsigned dependencies.
This is necessary because not all of UMD's dependencies are signed, so we cannot use HighSecurity.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpteti/umd. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [ABRMS License](http://www.dadhacker.com/blog/?p=2106#comments). In short, you can do whatever you'd like with this software, as long as you're not Richard M. Stallman.
