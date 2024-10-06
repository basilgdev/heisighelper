# Use an official Ruby runtime as a parent image
FROM ruby:3.3.5

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
# RUN apt-get update -qq && apt-get install -y nodejs
RUN apt-get update -qq && apt-get install -y

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Add a script to be executed every time the container starts
COPY bin/docker-entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]