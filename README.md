# Ticard

Easily work with Trello cards from your own text editor:

~~~bash
$ ticard pull http://trello.com/c/a2343423/my-card
$ vi a2343423-my-card.md
...
$ ticard push a2343423-my-card.md
~~~

## Installation

~~~bash
$ gem install ticard
~~~

Ticard needs trello read/write credentials in order to work. Create
a `.ticard.yml` file in `$HOME` or the directory you'll be working from.

~~~yaml
keys:
  developer_public_key:  'KEY'
  member_token:  'TOKEN'
~~~

To get the key and token, follow the steps given in [ruby-trello's
README](https://github.com/jeremytregunna/ruby-trello#configuration).

## Usage

* `ticard pull URL` to download the description of the card to a file
* `ticard push PATH` to upload the updated description.

The file created by `ticard pull` has an html comment with metadata at the
top, this allows `ticard push` to save and check if modifications have been
made to the card, so mess with them at your own risk :shit:
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ticard/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
