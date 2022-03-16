import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/model/characters_response.dart';
import 'package:futurama_thrive/app/core/model/info_response.dart';
import 'package:futurama_thrive/app/core/model/questions_response.dart';
import 'package:sizer/sizer.dart';

extension SizerMainTest on MaterialApp {
  Sizer get sizerMainTest => Sizer(builder: (context, orientation, deviceType) {
        return this;
      });
}

InfoResponse mockInfoResponse() => InfoResponse.fromJson([
      {
        "synopsis":
            "Philip J. Fry is a 25 year old delivery boy living in New York City who is cryogenically frozen on New Year's 1999 for 1000 years, where he wakes up in New New York City on December 31, 2999. There, he meets Turanga Leela, a tough but loving, beautiful one-eyed alien; and Bender, an alcohol-powered bending robot who is addicted to liquor, cigars, stealing, amongst other things. Eventually, they all meet up with Fry's Great, Great, Great, etc... Nephew, Hubert J. Farnsworth. Farnsworth is a very old man who is a genius but is very senile and forgetful. Fry, Leela, and Bender wind up working for Farnsworth's Planet Express Delivery Service. They then meet their co-workers; Amy Wong, who is a Martian intern who comes from a rich family, but is still a human who is very hip. Also, there is Hermes Conrad, who manages the delivery service and is pretty strict. Hermes seems Jamaican in voice and look. And finally, there's Dr. John Zoidberg, a lobster-like alien who is the crew's doctor. Unfortunately, he knows nothing about humans. Fry, Leela, Bender, and sometimes Amy and Dr. Zoidberg travel around the universe risking life and limb delivering packages and performing charitable tasks for tax deductions.",
        "yearsAired": "1999–2013",
        "creators": [
          {
            "name": "David X. Cohen",
            "url": "http://www.imdb.com/name/nm0169326"
          },
          {"name": "Matt Groening", "url": "http://www.imdb.com/name/nm0004981"}
        ],
        "id": 1
      }
    ]);

CharactersResponse mockCharactersResponse() => CharactersResponse.fromJson([
      {
        "name": {"first": "Philip", "middle": "Jay", "last": "Fry"},
        "images": {
          "head-shot": "",
          "main":
              "https://upload.wikimedia.org/wikipedia/en/2/28/Philip_Fry.png"
        },
        "gender": "Male",
        "species": "Human",
        "homePlanet": "Earth",
        "occupation": "Intergalactic Delivery Boy",
        "sayings": [
          "Shut up and take my money!",
          "I'm walking on sunshine, woah oh oooh",
          "This is how we do it. Pick your nose and chew it",
          "wow! I never would have thought of that.",
          "Bigfoot! He's real! I knew it! The Loch Ness Monster's book was right!",
          "I didn't ask for a completely reasonable excuse! I asked you to get busy!",
          "It's like a party in my mouth and everybody's throwing up!",
          "My God, it's full of ads!",
          "There's so many killbots behind us, I can't count them all. Three, I think.",
          "They're like sex, except I'm having them!",
          "We're in the middle of nowhere, which is the safest part of nowhere.",
          "When will young people learn that playing 'Dungeons and Dragons' doesn't make you cool!",
          "Why am I sticky and naked? Did I miss something fun?",
          "Wow! A superpowers drug you can just rub onto your skin? You'd think it would be something you'd have to freebase.",
          "Wow, you got that off the Internet? In my day, the Internet was only used to download pornography.",
          "But this is HDTV. It's got better resolution than the real world.",
          "Can I pull up my pants now?",
          "Existing is basically all I do!",
          "Hardy Boys: too easy. Nancy Drew: too hard!",
          "Hey look, it's that guy you are!",
          "Hooray, we don't have to do anything!",
          "How about me? I'm human, and I've always wanted to see the future!",
          "How can I live my life if I can't tell good from evil?",
          "I can burp the alphabet. A, B, D ... no, wait ...",
          "I did it! And it's all thanks to the books at my local library.",
          "I don't regret this, but I both rue and lament it.",
          "I have more important things to do today than laugh and clap my hands.",
          "I haven't had time off since I was twenty-one through twenty-four.",
          "I'll be whatever I wanna do.",
          "I'm going to continue never washing this cheek again.",
          "I'm gonna be a science fiction hero, just like Uhura, or Captain Janeway, or Xena!",
          "I'm literally angry with rage!",
          "I'm never gonna get used to the thirty-first century. Caffeinated bacon?",
          "I'm not a robot like you -- I don't like having disks crammed into me. Unless they're Oreos. And then only in the mouth.",
          "I must be a robot. Why else would human women refuse to date me?",
          "I refuse to testify on the grounds that my organs will be chopped up into a patty.",
          "It's all there, in the macaroni.",
          "It's a widely-believed fact!",
          "It's like a party in my mouth and everyone's throwing up.",
          "Leela, Bender, we're going grave-robbing.",
          "Leela, there's nothing wrong with anything.",
          "Make up some feelings and tell her you have them.",
          "My hands! My horrible, human hands!",
          "No, no, I was just picking my nose.",
          "People said I was dumb but I proved them!",
          "Please, Mr. Nixon! We're appealing to your sense of decency!",
          "Prepare to be thought at!",
          "Robots don't go to heaven.",
          "Stop abducting me!",
          "Sweet justice! Sweet, juicy justice!",
          "That doesn't look like an 'L', unless you count lower case.",
          "That's a chick show. I prefer programs of the genre World's Blankiest Blank.",
          "The butter in my pocket is melting!",
          "The less fortunate get all the breaks!",
          "There's a lot about my face you don't know.",
          "There's a political debate on. Quick, change the channel!",
          "These new hands are great. I'm gonna break them in tonight.",
          "The spoon's in the foot powder.",
          "They're great! They're like sex except I'm having them.",
          "What kind of bozos would start a Bender protest group?",
          "Where's Captain Bender? Off catastrophizing some other planet?",
          "Why use my own legs like an idiot when I can use a Chickenwalker?",
          "You'll barely regret this.",
          "You mean Bender is the evil Bender? I'm shocked! Shocked! Well not that shocked."
        ],
        "id": 1,
        "age": "25"
      },
      {
        "name": {"first": "Turanga", "middle": "", "last": "Leela"},
        "images": {
          "head-shot": "",
          "main":
              "https://upload.wikimedia.org/wikipedia/en/d/d4/Turanga_Leela.png"
        },
        "age": "32",
        "gender": "Female",
        "species": "Mutant",
        "homePlanet": "Earth",
        "occupation": "Captain and pilot",
        "sayings": [
          "Bender, this is Fry's decision... and he made it wrong. So it's time for us to interfere in his life.",
          "With my Oxo Goodgrips cheese knife, I stab at thee!",
          "I usually try to keep my sadness pent up inside where it can fester quietly as a mental illness.",
          "I was having the most wonderful dream. Except you were there, and you were there, and you were there!",
          "That's not a career, more of a felony.",
          "That's not a warning! A warning's supposed come before something bad happens.",
          "This is my first visit to the Galaxy of Terror and I'd like it to be a pleasant one.",
          "This isn't heaven! It just looks exactly like it and makes us immortal! Which I find suspicious.",
          "Unit 10 - Target H, 16K - niner, niner! Go left - I mean right!",
          "What is the secret of time travel doing on Fry's ass?",
          "Do you have idiots on your planet?",
          "He opened up relations with China. He doesn't want to hear about your ding-dong.",
          "I'm a millionaire! Suddenly I have an opinion about the capital gains tax.",
          "My old life wasn't as glamorous as my webpage made it look.",
          "No, Leela will show you out.",
          "There's a political debate on. Quick, change the channel!",
          "This is by a wide margin the least likely thing that has ever happened.",
          "This toads the wet sprocket.",
          "This wangs chung.",
          "You did the best you could, I guess, and some of these gorillas are okay."
        ],
        "id": 2
      }
    ]);

QuestionsResponse mockQuestionsResponse() => QuestionsResponse.fromJson([
      {
        "id": 1,
        "question": "What is Fry's first name?",
        "possibleAnswers": ["Fred", "Philip", "Will", "John"],
        "correctAnswer": "Philip"
      },
      {
        "id": 2,
        "question": "In 'Benders Big Score' what ailen species scam the earth?",
        "possibleAnswers": [
          "Nibbloniens",
          "Omicrons",
          "Robots",
          "Nudest aliens",
          "Tentacals"
        ],
        "correctAnswer": "Nudest aliens"
      },
      {
        "id": 3,
        "question": "What is benders middle and last name?",
        "possibleAnswers": [
          "E Smithie",
          "Flam Flexo",
          "Lobster Squid",
          "Bending Rodriguez",
          "Steven martin"
        ],
        "correctAnswer": "Bending Rodriguez"
      }
    ]);
