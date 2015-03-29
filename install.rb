#!/usr/bin/env ruby

# No bash, because no one's understand that

sym_link = ->(file) {  system "ln -fs #{File.join(Dir.pwd, file)} $HOME/" }

load_path = ->(dir) do
  return if dir === '.git'

  if File.directory?(dir)
    Dir.entries(dir).map do |file|
      Dir.chdir(dir) { sym_link.call(file) }
    end
  end
end

Dir.glob('./**').map(&load_path)




