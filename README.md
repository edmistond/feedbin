# Feedbin

A Ruby library for interacting with the Feedbin API. This is currently a work in progress. My interest is primarily in managing my tags and subscriptions rather than building a full-blown client for pulling article contents as well. That said, I am amenable to adding that functionality and pull requests are welcome.

Currently (partially) implemented:

* Get all subscriptions
* Get all tags
* Delete a subscription by subscription id
* Given a tag name, delete all subscriptions for it

I have actually been running this against a quick mockup of the feedbin API in a separate Sinatra project; this is partly as I haven't yet implemented support for Feedbin's caching scheme and I don't want to irritate them.

I disclaim any responsibility if this eats your Feedbin profile. Use at your own risk and run an export on your feeds before you start testing it!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/edmistond/Feedbin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

