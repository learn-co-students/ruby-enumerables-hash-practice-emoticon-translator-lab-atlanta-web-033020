require 'yaml'

def load_library(file)
  emoticon = YAML.load_file('./lib/emoticons.yml')
  
  emote_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoticon.each do |meaning, emote|
    emote_hash['get_emoticon'][emote[0]] = emote[1]
    emote_hash['get_meaning'][emote[1]] = meaning
    end
  emote_hash
  
end

def get_japanese_emoticon(file, emoticon)
  emoticon_hash = load_library(file)['get_emoticon'][emoticon]
  
  if !emoticon_hash
    return "Sorry, that emoticon was not found"
  end
  emoticon_hash
end

def get_english_meaning(file, emoticon)
  emoticon_hash = load_library(file)['get_meaning'][emoticon]
  if !emoticon_hash
    return "Sorry, that emoticon was not found"
  end
  emoticon_hash
end