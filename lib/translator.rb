# require modules here
require "yaml"

require 'pry'
def load_library(file)
  # code goes here
  # yaml 6:45 video https://www.youtube.com/watch?v=F7JQxXhceZo
  
                  emoticons = YAML.load_file(file)

        # Below does not require the file parameter to load the file & see its contents
        # emoticons = YAML.load(File.open(File.join(File.dirname(__FILE__), 'emoticons.yml')))
        
                  translator = {
                   "get_meaning" => {},
                   "get_emoticon" => {}
                 }
                 
                 emoticons.each_pair do |word_expressions, emos|
                    
                            translator["get_meaning"][emos[1]] = word_expressions
                            translator["get_emoticon"][emos[0]] = emos[1]
                 end
                 
          translator
  
end

# p load_library("./lib/emoticons.yml")



def get_japanese_emoticon(file, emoticon)
  # code goes here
  
    translator = load_library(file)["get_emoticon"][emoticon]
  #
    
   translator ? translator : "Sorry, that emoticon was not found"
 
  
end





def get_english_meaning(file, emoticon)
  # code goes here
  
  translator = load_library(file)["get_meaning"][emoticon]
  
    
   translator ? translator : "Sorry, that emoticon was not found"
  
end