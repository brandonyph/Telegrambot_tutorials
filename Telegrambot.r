##https://cran.r-project.org/web/packages/telegram.bot/telegram.bot.pdf
##https://api.telegram.org/bot1891124738:AAGJqKVPraN6G_ZM53QPm3Ast5oOfQ7Nvxk/getUpdates

library(telegram.bot)
library(stringr)

bot_token <- "1891124738:AAGJqKVPraN6G_ZM53QPm3Ast5oOfQ7Nvxk"
target_chat_id <- 606114091

bot <- Bot(token = bot_token)

bot_sendmessage <-
  function(text_to_sent) {
    bot$sendMessage(606114091,
                    text_to_sent,
                    parse_mode = NULL)
  }

#example of sending a message
#bot_sendmessage("because people are very very")



while (TRUE) {
  Sys.sleep(2)
  #sent message every hour
  if (format(Sys.time(), "%M") == "00") {
    if (format(Sys.time(), "%H") == "08") {
      bot_sendmessage("Good Morning")
    }
    
    if (as.numeric(format(Sys.time(), "%H")) == round(runif(1, 8, 23))) {
      bot_sendmessage("How are you today")
      bot_sendmessage("I miss you very much")
    }
    
    if (format(Sys.time(), "%H") == "23") {
      bot_sendmessage("Good Night beautiful")
      Sys.sleep(round(runif(1, 1, 10)))
      bot_sendmessage("Sweet Dreams")
    }
    
  }
  
  #sent message based on last reply in chat
  
  if (TRUE) {
    ##obtain last message
    
    history <- bot$getUpdates()
    if (length(history) != 0) {
      lastmessage <- history[[length(history)]]
      
      lasttext <- lastmessage$message$text
      lastuser <- lastmessage$message$from$first_name
      
      print(lastuser)
      print(lasttext)
      
      if (str_detect(lasttext, "Do you love me?")) {
        bot_sendmessage("I love you very much?")
        Sys.sleep(1)
        bot$clean_updates()
      }
      
      if (str_detect(lasttext, "Who are you")) {
        bot_sendmessage("I am a very nice person?....definitely not a auto-replying robot")
        Sys.sleep(1)
        bot$clean_updates()
      }
      
      if (str_detect(lasttext, "what for dinner")) {
        bot_sendmessage("your love is enough for survival")
        Sys.sleep(1)
        bot$clean_updates()
      }
      
      if (str_detect(lasttext, "what'up")) {
        bot_sendmessage("ceiling fan")
        Sys.sleep(1)
        bot$clean_updates()
      }
      
    }
  }
}
