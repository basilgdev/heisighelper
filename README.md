
# Heisig Helper

A simple web page built in Rails that parses a given Japanese sentence and breaks down each kanji into their radical components as they appear in James Heisig's Remembering the Kanji vol. I. The link allow you to copy the results into the clipboard.

## Screenshot
  
![image](https://github.com/user-attachments/assets/4168a3b7-8dd9-43c7-847b-7fb25d4be1d1)

## Setup

### Docker

First setup the database, and then run the container.

```
docker-compose run --rm app bin/rails db:setup
docker-compose up
```
If you need to run migrations:

```
docker-compose run --rm app bin/rails db:migrate
```

### Locally

Install Rails 7.2.1 and Ruby 3.3.5.

 ```
bundle install
rails db:setup
```

Run `rails server` to start.
  
## Usage

Simply paste a Japanese sentence with kanji to get some results!