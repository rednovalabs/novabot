# Description:
#   Lagomorphs facts!
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot rabbit fact - A randomly selected rabbit fact
#
# Author:
#   Smalls

facts = [
  'Rabbits and bunnies are the same animal – there’s no difference in breed or species, just the word we prefer.',
  'Rabbits and hares are “lagomorphs”, an order that also includes the pika, a small burrowing mammal that looks like a large mouse and lives in colder climates.',
  'Lagomorphs were originally classified as rodents, but in 1912 the distinction was made between them and rodents.',
  'Hares are born with their eyes open, hair covering their bodies, and they can run within a few minutes of birth (much like a Guinea pig!).  Rabbits, on the other hand, are born blind, naked, and remain in a fur-lined nest for the first days of their lives.',
  'Jackrabbits, which belong to the genus “Lepus,” have been clocked at speeds of 45 miles per hour.',
  'Rabbits are meticulously clean animals and are easy to house break and train.  Much like a dog, a pet rabbit can be taught to come to his/her name, sit in your lap, and do simple tricks.',
  'Happy rabbits practice a cute behavior known as a “binky:” they jump up in the air and twist and spin around!',
  'A baby rabbit is called a kit, a female is called a doe, and a male is a buck.  A group of rabbits is called a herd.',
  'Rabbits are herbivores, eating a diet entirely of grasses and other plants.  Because their diet contains so much cellulose, they pass two different kinds of feces to completely break down their food.  While other grazers will chew and swallow their feed, then “burp” it back up (as cows chew cud), rabbits will re-ingest their feces on the first pass to get all of the nutrients they need.',
  'The average size of a rabbit litter is usually between 4 and 12 babies, which results after a short 30-day gestation.  Male rabbits can reproduce as early as 7 months of age, and females as early as 4 months.  This means in one year a single female rabbit can produce as many as 800 children, grandchildren, and great-grandchildren!',
  'A rabbit’s life span is about 8 years, though sterilized rabbits (those who are spayed/neutered) can live as long as 10-12 years.',
  'A rabbit’s teeth never stop growing!  Many people believe they need to chew to keep their teeth short.  While they do enjoy chewing, it’s the normal wear from where their top and bottom teeth meet that keeps a rabbit’s teeth short.',
  'Can you guess what other domestic animal is similar to rabbits?  A horse!  They have similar eyes, teeth, and ears (those belonging to many prey animals), as well as a similar diet and behavior.',
  'A rabbit symbol is often used to show that a product was not tested on animals.  This is because rabbits have traditionally been used in product safety testing.',
  'Bunnies cannot vomit, so it is super important to feed them only healthy, fresh, appropriate food.',
]

module.exports = (robot) ->
  robot.respond /rabbit fact/i, (msg) ->
    msg.send msg.random facts 
