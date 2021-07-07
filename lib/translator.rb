# require modules here
require "yaml"

def load_library(file)
  # code goes here
  parse_file = YAML.load_file(file)
  parsed_hash = {get_meaning: {}, get_emoticon: {}}
  #keys = parse_file.keys
  
  parse_file.each do |meaning|
    parsed_hash[:get_meaning][meaning[1][1]] = meaning[0].to_s
    parsed_hash[:get_emoticon][meaning[1][0]] = meaning[1][1]
  end
  
  parsed_hash
end

def get_japanese_emoticon(file, eng_emo)
  # code goes here
  loaded_file = load_library(file)
  lookup = loaded_file[:get_emoticon][eng_emo]
  result = nil
  if lookup then
    result = lookup else
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(file, jap_emo)
  # code goes here
  loaded_file = load_library(file)
  pp loaded_file
  lookup = loaded_file[:get_meaning][jap_emo]
  result = nil
  if lookup then
    result = lookup else
    result = "Sorry, that emoticon was not found"
  end
  result
end