#!/usr/bin/env python

import logging
import time
import pygame
import wave

pygame.mixer.init()

# merlin1 font text to ASCII
print("""\
  ________  _____  ___        __       ______   __   ___         ______    ____  ____   _______   ________  ___________  ___
 /"       )(\"   \|"  \      /""\     /" _  "\ |/"| /  ")       /    " \  ("  _||_ " | /"     "| /"       )("     _   ")|"  |
(:   \___/ |.\\   \    |    /    \   (: ( \___)(: |/   /       // ____  \ |   (  ) : |(: ______)(:   \___/  )__/  \\__/ ||  |
 \___  \   |: \.   \\  |   /' /\  \   \/ \     |    __/       /  /    )  )(:  |  | . ) \/    |   \___  \       \\_ /    |:  |
  __/  \\  |.  \    \. |  //  __'  \  //  \ _  (// _  \      (: (____/ //  \\ \__/ //  // ___)_   __/  \\      |.  |   _|  /
 /" \   :) |    \    \ | /   /  \\  \(:   _) \ |: | \  \      \         \  /\\ __ //\ (:      "| /" \   :)     \:  |  / |_/ )
(_______/   \___|\____\)(___/    \___)\_______)(__|  \__)      \"____/\__\(__________) \_______)(_______/       \__| (_____/



      """)

print("Welcome to Snack Quest!\n")

print("This is a game of self-discovery and snacking.\n")

start_button = input("Are you ready to begin?\n")
if start_button.lower() == 'yes' or start_button.lower() == 'y':
    print("\nThen let's get going...\n")
else:
    exit()

for n in range(3):
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    time.sleep(1)

player_name = input("\nFirst off, what is your name?\n")

time.sleep(2)
print("\nWow... " + player_name + ", huh" + "...\n\n" + "That's.. heh..\n")
time.sleep(1)
# haha u lame
print("Such a cool name..\n")
time.sleep(2)
print("Anyways, we might as well get started.\n")

time.sleep(2)

print("Always remember, " + player_name + ", some snacks may hurt you.\n")

time.sleep(3)

print("""\
  ______    __    __       __         _______  ___________  _______   _______          ______    _____  ___    _______
 /" _  "\  /" |  | "\     /""\       |   __ "\("     _   ")/"     "| /"      \        /    " \  (\"   \|"  \  /"     "|
(: ( \___)(:  (__)  :)   /    \      (. |__) :))__/  \\__/(: ______)|:        |      // ____  \ |.\\   \    |(: ______)
 \/ \      \/      \/   /' /\  \     |:  ____/    \\_ /    \/    |  |_____/   )     /  /    ) :)|: \.   \\  | \/    |
 //  \ _   //  __  \\  //  __'  \    (|  /        |.  |    // ___)_  //      /     (: (____/ // |.  \    \. | // ___)_
(:   _) \ (:  (  )  :)/   /  \\  \  /|__/ \       \:  |   (:      "||:  __   \      \        /  |    \    \ |(:      "|
 \_______) \__|  |__/(___/    \___)(_______)       \__|    \_______)|__|  \___)      \"_____/    \___|\____\) \_______)


      """)
time.sleep(3)

print("""\
You awake to find last night's chip crumbs and salt caked across the lower right part of your mouth and chin.

The offending chips' bag lies crumpled and half-spilled on the carpet next to the couch.

The high-pitched whine of your CRT TV is the only sound in the room. You feel like death.
      """)

time.sleep(2)

def game_over():
    # swamp land font text to ASCII
    print("\n")
    print("""\
 _____ _____ __  __ _____    _____ __ __ _____ _____
/   __/  _  /  \/  /   __\  /  _  /  |  /   __/  _  \
|  |_ |  _  |  \/  |   __|  |  |  \  |  |   __|  _  <
\_____\__|__\__ \__\_____/  \_____/\___/\_____\__|\_/

          """)
    pygame.mixer.music.load("game_over.mp3")
    pygame.mixer.music.play()
    time.sleep(10)

def get_water():
    print("\n")
    print("""\
   ,--,
   )""(
  /    \
 /      \
`        `
|`-....-'|
|        |
|        |
|`-....-'|
|        |
|        |
 `-....-'

          """)
    pygame.mixer.music.load("gulp.mp3")
    pygame.mixer.music.play(2)

def get_hurt():
    print("""\


FFFFFFFFFFFFFFFFFFFFFF                                   kkkkkkkk           !!!
F::::::::::::::::::::F                                   k::::::k          !!:!!
F::::::::::::::::::::F                                   k::::::k          !:::!
FF::::::FFFFFFFFF::::F                                   k::::::k          !:::!
  F:::::F       FFFFFuuuuuu    uuuuuu     cccccccccccccccck:::::k    kkkkkk!:::!
  F:::::F            u::::u    u::::u   cc:::::::::::::::ck:::::k   k:::::k!:::!
  F::::::FFFFFFFFFF  u::::u    u::::u  c:::::::::::::::::ck:::::k  k:::::k !:::!
  F:::::::::::::::F  u::::u    u::::u c:::::::cccccc:::::ck:::::k k:::::k  !:::!
  F:::::::::::::::F  u::::u    u::::u c::::::c     ccccccck::::::k:::::k   !:::!
  F::::::FFFFFFFFFF  u::::u    u::::u c:::::c             k:::::::::::k    !:::!
  F:::::F            u::::u    u::::u c:::::c             k:::::::::::k    !!:!!
  F:::::F            u:::::uuuu:::::u c::::::c     ccccccck::::::k:::::k    !!!
FF:::::::FF          u:::::::::::::::uc:::::::cccccc:::::k::::::k k:::::k
F::::::::FF           u:::::::::::::::uc:::::::::::::::::k::::::k  k:::::k  !!!
F::::::::FF            uu::::::::uu:::u cc:::::::::::::::k::::::k   k:::::k!!:!!
FFFFFFFFFFF              uuuuuuuu  uuuu   ccccccccccccccckkkkkkkk    kkkkkkk!!!


         """)
    pygame.mixer.music.load("ow.mp3")
    pygame.mixer.music.play()

choice_1_1 = input("\nDo you..\n A) Reach for the TV Remote..\n B) Reach for a glass of water..\n C) Get off the couch..\n ")
if choice_1_1.lower() == 'a':
    print("\nThe remote is slightly out of reach. You slip off the couch weirdly onto your neck, becoming paralyzed for life.")
    time.sleep(2)
    print("\nNo more snacks for you...\n")

    time.sleep(1)
    game_over()
    exit()
elif choice_1_1.lower() == 'b':
    print("\nGood choice, " + player_name + ", your throat was so dry you might have choked on your own filth")
    print("\nYou drink the tepid water quickly. It spills down your chin and washes away the chip crumbs.")
    get_water()
    time.sleep(3)
elif choice_1_1.lower() == 'c':
    print("\nYou get up too quickly and breathe in a particulary large chip crumb..\n")
    time.sleep(1)
    print("You choke to death slowly on chip crumbs and your own fat neck..\n")
    time.sleep(2)
    print("No more snacks for you, buddy.\n")
    game_over()
    exit()
else:
    print("Stick to the script, " + player_name + "..")
    time.sleep(1)
    game_over()
    exit()

time.sleep(2)

print("\nYour stomach settles a bit and you slowly peel yourself off the couch")
time.sleep(3)
print("\nTime to find some snacks...")
time.sleep(1)

choice_1_2 = input("\nDo you..\n A) Run to the fridge..\n B) Check the couch cushions..\n C) Go to the store..\n ")
if choice_1_2.lower() == 'a':
    print("\nYou stub your toe on the coffee table. The excruciating pain in your now-broken toe is dulled\n by the pain of you entering cardiac arrest.")
    get_hurt()
    time.sleep(2)
    print("\nYou have no friends or family to call an ambulance. No rescue and no snacks for you...\n")
    time.sleep(2)
    game_over()
    exit()
elif choice_1_2.lower() == 'b':
    print("\nWow, " + player_name + ", that's gross even for you...")
    print("\nYou find an old stick of beef jerky covered in dust")
    time.sleep(3)
    print("\nThe horrid taste of rotten jerky induces projectile vomiting")
    pygame.mixer.music.load("vomit.mp3")
    pygame.mixer.music.play(2)
    time.sleep(4)
    print("\nYou can't stop vomiting. You lose all snacks and die")
    time.sleep(3)
    game_over()
    exit()
elif choice_1_2.lower() == 'c':
    print("\nYou get your shoes on and go out into your car\n")
    time.sleep(1)
    print("\nYou put your favorite tunes on and prepare for a relaxing drive")
    time.sleep(2)
    for n in range(3):
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        time.sleep(1)
    exit()
else:
    print("Stick to the script, " + player_name + "..")
    time.sleep(1)
    game_over()
    exit()


def get_name(name):
    return name
