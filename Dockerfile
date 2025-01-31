# Use the official Ubuntu image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    ruby-full \
    build-essential \
    zlib1g-dev \
    git

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Set the working directory
WORKDIR /site

COPY Gemfile ./

RUN bundle install

# Expose the Jekyll default port (4000)
EXPOSE 4000

# Start Jekyll serve
CMD ["bundle", "exec", "jekyll", "serve" , "--host", "0.0.0.0"]
