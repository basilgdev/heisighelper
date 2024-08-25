# Heisig Helper

A simple web page built with Rails that parses a given Japanese sentence and breaks down each kanji into their radical components as they appear in James Heisig's Remembering the Kanji vol. I. The links allow you to copy the result(s) into the clipboard.

## Screenshot

![image](https://github.com/user-attachments/assets/4168a3b7-8dd9-43c7-847b-7fb25d4be1d1)

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

