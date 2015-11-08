#!/usr/bin/env ruby

# No bash, because no one's understand that

sym_link = ->(file) {
  path = File.realpath(file)
  puts "Creating #{path} into #{ENV['HOME']}"
  system "ln -fs #{path} $HOME/"
}

load_path = ->(dir) do
  Dir
    .glob("#{dir}/.*")
    .reject(&File.method(:directory?))
    .map(&sym_link)
end

load_path.call('./{*, .*}')

