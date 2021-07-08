require 'yaml'
require 'pry'
input = YAML.load_file('./lib/emoticons.yml')

def load_library(file)
  emoticons = YAML.load_file(file)
  my_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  emoticons.each do |eng_meaning, icons_array|
    #binding.pry
    my_hash[:get_meaning][icons_array[1]] = eng_meaning
    my_hash[:get_emoticon][icons_array[0]] = icons_array[1]
  end
  my_hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  if !hash[:get_emoticon][emoticon]
    "Sorry, that emoticon was not found"
  else
    hash[:get_emoticon][emoticon]
  end
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  if !hash[:get_meaning][emoticon]
    "Sorry, that emoticon was not found"
  else
    hash[:get_meaning][emoticon]
  end
end