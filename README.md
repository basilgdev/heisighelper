# Heisig Helper

A simple web page built with Rails that parses a given Japanese sentence and breaks down each kanji into their radical components as they appear in James Heisig's Remembering the Kanji vol. I. The links allow you to copy the result(s) into the clipboard.

[Screenshot](https://github.com/basilgdev/heisighelper/assets/42182755/8d73da80-d74a-45ec-8df5-850e1b46445c)



## Setup

Install Rails 7.1.2 and Ruby 3.2.2. And then, run:

```
bundle install
rails db:create
rails db:migrate
rails db:seed
```

Run `rails server` to start.

## Usage

Simply paste a Japanese sentence with kanji to get some results!

## Roadmap
- [ ] Export results to CSV
- [ ] Dockerise app
- [ ] Add functionality to create user accounts
- [ ] Add associations to allow mnemonics to be saved per kanji, per user
- [ ] Add functionality to generate AI mnemonics
- [ ] Add functionality create lists and favourites


