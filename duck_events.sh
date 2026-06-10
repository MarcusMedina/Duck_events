#!/bin/bash
# ==============================================================================
#  🦆 duck_events.sh – (Refactored v3.0 - The Full Canon Nerd Chart Edition)
#  Quirky, optimized terminal greetings & reminders.
# ==============================================================================

clear -x 
printf '\033[3J'

# --- ASCII Duck Greeter ---
echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠿⠿⠷⣶⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠀⢀⣀⡀⠙⣷ ⠀⠀⠀
⠀⠀⠀⡀⠀⠀⠀⠀⠀⢠⣿⠁⠀⠀⠀⠘⠿⠃⠀⢸⣿⣿⣿⣿
⠀⣠⡿⠛⢷⣦⡀⠀⠀⠈⣿⡄⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⠟
⢰⡿⠁⠀⠀⠙⢿⣦⣤⣤⣼⣿⣄⠀⠀⠀⠀⠀⢴⡟⠛⠋⠁⠀
⣿⠇⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠈⣿⡀⠀⠀⠀
⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀
⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡇⠀⠀⠀
⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠀⠀⠀⠀
⠀⠹⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣰⡿⠁⠀⠀⠀⠀
⠀⠀⠀⠉♠⠛⠿⠶⣶⣶⣶⣶⣶⠶⠿⠟⠛⠉⠀⠀⠀⠀⠀⠀
"

# --- Date and Time Setup (Optimized) ---
# Get all date/time components in one efficient call
read -r today time weekday_num weekday month_day day month hour minute < <(date +"%Y-%m-%d %H:%M:%S %u %A %m-%d %d %m %H %M")
# Get day of the year (sed is used for portability across systems)
day_of_year=$(date +%j | sed 's/^0*//')

echo "The duck welcomes you $USER $today at $time..."
echo ""

# ==============================================================================
#  ✨ GREETING LOGIC
# ==============================================================================

# --- STEP 1: Zodiac Sign Calculator ---
# Traditional Western Zodiac
if   [[ "$month_day" > "03-20" && "$month_day" < "04-20" ]]; then
    echo "Today's Zodiac sign is ♈ Aries."
elif [[ "$month_day" > "04-19" && "$month_day" < "05-21" ]]; then
    echo "Today's Zodiac sign is ♉ Taurus."
elif [[ "$month_day" > "05-20" && "$month_day" < "06-21" ]]; then
    echo "Today's Zodiac sign is ♊ Gemini."
elif [[ "$month_day" > "06-20" && "$month_day" < "07-23" ]]; then
    echo "Today's Zodiac sign is ♋ Cancer."
elif [[ "$month_day" > "07-22" && "$month_day" < "08-23" ]]; then
    echo "Today's Zodiac sign is ♌ Leo."
elif [[ "$month_day" > "08-22" && "$month_day" < "09-23" ]]; then
    echo "Today's Zodiac sign is ♍ Virgo."
elif [[ "$month_day" > "09-22" && "$month_day" < "10-23" ]]; then
    echo "Today's Zodiac sign is ♎ Libra."
elif [[ "$month_day" > "10-22" && "$month_day" < "11-22" ]]; then
    echo "Today's Zodiac sign is ♏ Scorpio."
elif [[ "$month_day" > "11-21" && "$month_day" < "12-22" ]]; then
    echo "Today's Zodiac sign is ♐ Sagittarius."
elif [[ "$month_day" > "12-21" || "$month_day" < "01-20" ]]; then
    echo "Today's Zodiac sign is ♑ Capricorn."
elif [[ "$month_day" > "01-19" && "$month_day" < "02-19" ]]; then
    echo "Today's Zodiac sign is ♒ Aquarius."
else
    echo "Today's Zodiac sign is ♓ Pisces."
fi

# --- STEP 1b: Moon Phase Calculator ---
moon_phases=("🌑 New Moon" "🌒 Waxing Crescent" "🌓 First Quarter" "🌔 Waxing Gibbous" "🌕 Full Moon" "🌖 Waning Gibbous" "🌗 Last Quarter" "🌘 Waning Crescent")
moon_idx=$(awk -v now="$(date +%s)" 'BEGIN {
    new_moon = 947182440  # 2000-01-06 18:14 UTC reference new moon
    cycle = 2551442.8     # synodic month length in seconds
    frac = (now - new_moon) / cycle
    frac -= int(frac)
    if (frac < 0) frac += 1
    printf "%d", int(frac * 8 + 0.5) % 8
}')
echo "Tonight's moon: ${moon_phases[$moon_idx]}"


# --- STEP 2: Personal Dates & Reminders (private, optional, per-user) ---
if [ -f "$HOME/duck_personal.sh" ]; then
    source "$HOME/duck_personal.sh"
fi

# --- STEP 3: Worldly, Geeky & Special Dates ---
# General Holidays & Events
case "$month_day" in
  "01-01") echo "🎉 Happy New Year's Day! And National Pizza Day in Sweden. Perfect hangover food." ;;
  "02-02") echo "🐿️ Happy Groundhog Day! Will the winter end soon?" ;;
  "02-13") echo "⚙️ C# 1.0 was released (2002)." ;;
  "02-14") echo "❤️ Happy Valentine's Day!" ;;
  "02-18") echo "🤖 Perseverance Rover landing anniversary (2021) on Mars." ;;
  "02-22") echo "🐱 Nyan Nyan Nyan! Happy Cat Day in Japan!" ;;
  "03-14") echo "🥧 Happy Pi Day! (3.14) & 🤍 Happy White Day!" ;;
  "03-21") echo "🧦 mismatched socks today for World Down Syndrome Day!" ;;
  "03-31") echo "💾 World Backup Day. Have you backed up your files recently? DO IT NOW." ;;
  "04-01") echo "🃏 April Fools' Day. Trust no one. Not even this terminal." ;;
  "04-22") echo "🌎 Happy Earth Day! Take a moment to appreciate our planet." ;;
  "04-26") echo "👽 Alien Day (for LV-426)!"; echo "☢️ Chernobyl disaster anniversary (1986)." ;;
  "06-06") echo "🇸🇪 Happy National Day of Sweden!" ;;
  "07-20") echo "🌕 Apollo 11 Moon Landing anniversary (1969)." ;;
  "08-08") echo "🐈 International Cat Day – meeeeooow!" ;;
  "09-10") echo "🛸 The X-Files premiere anniversary. The truth is out there." ;;
  "09-19") echo "☠️ Talk Like a Pirate Day — Arrr matey, code ye must!" ;;
  "09-21") echo "🕊️ International Day of Peace." ;;
  "09-25") echo "📚 National Comic Book Day!" ;;
  "10-05") echo "🧑‍🏫 World Teachers' Day! Thank a teacher." ;;
  "10-11") echo "🏳️‍🌈 National Coming Out Day. Be proud of who you are." ;;
  "10-12") echo "📚 Hitchhiker's Guide to the Galaxy publication anniversary." ;;
  "10-21") echo "⚡ Back to the Future Day! Where we're going, we don't need roads." ;;
  "12-01") echo "🎶 It's the first of the month... I'm telling you, I'm ready for 'Back to December'." ;;
  "12-09") echo "📟 Happy International ASCII Day!" ;;
  "12-10") echo "🎬 The Fellowship of the Ring premiered in London (2001)." ;;
  "12-13") echo "🕯️ Glad Lucia! Time for lussekatter and songs." ;;
  "12-24") echo "🎄 Christmas Eve – close the terminal and open presents!" ;;
  "12-25") echo "🎄 Merry Christmas!" ;;
  "12-31") echo "🥂 New Year's Eve! Get ready for the countdown." ;;
esac

# Swedish Nerd Pride
case "$month_day" in
  "12-01") echo "🎹 Commodore 64 reached Sweden (1983). 8-bit glory begins!" ;;
  "05-17") echo "🎮 Minecraft Alpha launched (2009) — from Sweden to the world." ;;
  "10-07") echo "🎶 Spotify launched in Stockholm (2008)." ;;
  "07-01") echo "📱 First GSM call (1991, Stockholm). Hello, mobile era!" ;;
esac

# Gaming Legends
case "$month_day" in
  "01-26") echo "🐉 Dungeons & Dragons released (1974). Roll initiative!" ;;
  "02-21") echo "🔺 The Legend of Zelda released in Japan (1986). It's dangerous to go alone! Take this." ;;
  "03-10") echo "🍄 MAR10 Day — It's-a-me, Mario!" ;;
  "03-22") echo "🧟 Resident Evil release (1996). Enter survival horror." ;;
  "05-22") echo "🟡 Pac-Man Day (1980). Waka-waka forever."; echo "🏛️ Unreal released (1998)." ;;
  "06-06") echo "🕹️ Tetris released (1984). Rotate responsibly!" ;;
  "06-19") echo "💥 Counter-Strike beta (1999). Rush B!" ;;
  "06-22") echo "🧱 Quake release (1996). Gib responsibly." ;;
  "07-09") echo "🐒 Donkey Kong release (1981). It’s on like Donkey Kong!" ;;
  "08-31") echo "☢️ Command & Conquer: Red Alert released (1996)." ;;
  "11-07") echo "🪐 Mass Effect N7 Day." ;;
  "11-11") echo "🌌 Skyrim release (2011). FUS RO DAH!" ;;
  "11-19") echo "🪖 Half-Life release (1998). Gordon Freeman reporting." ;;
  "11-22") echo "🏆 Unreal Tournament released (1999)." ;;
  "11-23") echo "⚔️ World of Warcraft launched (2004)." ;;
  "12-02") echo "🚀 Quake III Arena released (1999)." ;;
  "12-10") echo "🔫 DOOM release (1993). Rip & tear!" ;;
esac

# Classic Sci-Fi & Cult Films
case "$month_day" in
  "06-03") echo "💻 WarGames premiered (1983). Shall we play a game?" ;;
  "07-09") echo "💿 TRON premiered (1982). End of line." ;;
  "09-18") echo "🛸 The Day the Earth Stood Still premiered (1951). Klaatu barada nikto." ;;
  "09-26") echo "🎭 Carnival of Souls premiered (1962)." ;;
  "10-21") echo "👹 The Doom movie premiered (2005). Rip & tear, on screen this time." ;;
esac

# Star Wars Universe
case "$month_day" in
    "05-04") echo "🌌 Star Wars Day – May the 4th be with you!" ;;
    "05-05") echo "⚫ Revenge of the Fifth! The Sith are celebrating." ;;
    "05-25") echo "⚔️ A New Hope premiered (1977)." ;;
    "11-12") echo "🎬 The Mandalorian premiered (2019)." ;;
    "09-21") echo "🎬 Andor premiered (2022)." ;;
    "10-03") echo "🎬 The Clone Wars series premiered (2008)." ;;
esac

# Star Trek Universe
case "$month_day" in
  "09-08") echo "🖖 Star Trek: The Original Series premiered (1966)." ;;
  "09-20") echo "🖖 Star Trek: The Next Generation premiered (1987)." ;;
  "01-03") echo "🖖 Star Trek: Deep Space Nine premiered (1993)." ;;
  "01-16") echo "🖖 Star Trek: Voyager premiered (1995)." ;;
  "09-26") echo "🖖 Star Trek: Enterprise premiered (2001)." ;;
  "09-24") echo "🖖 Star Trek: Discovery premiered (2017)." ;;
  "01-23") echo "🖖 Star Trek: Picard premiered (2020)." ;;
  "08-06") echo "🖖 Star Trek: Lower Decks premiered (2020)." ;;
  "05-05") echo "🖖 Star Trek: Strange New Worlds premiered (2022)." ;;
esac

# Doctor Who Premieres (Full Canon)
case "$month_day" in
  "11-23") echo "🕰️ 1st Doctor (Hartnell) debut (1963) & War Doctor (Hurt) reveal (2013).";;
  "11-05") echo "🕰️ 2nd Doctor (Troughton) debut (1966)." ;;
  "01-03") echo "🕰️ 3rd Doctor (Pertwee) debut (1970)." ;;
  "12-28") echo "🕰️ 4th Doctor (Tom Baker) debut (1974)." ;;
  "01-04") echo "🕰️ 5th Doctor (Davison) debut (1982)." ;;
  "03-22") echo "🕰️ 6th Doctor (Colin Baker) debut (1984)." ;;
  "09-07") echo "🕰️ 7th Doctor (McCoy) debut (1987)." ;;
  "05-27") echo "🕰️ 8th Doctor (McGann) debut (1996)." ;;
  "03-26") echo "🕰️ 9th Doctor (Eccleston) debut & series reboot (2005). Fantastic!" ;;
  "12-25") echo "🕰️ 10th Doctor (Tennant) debut (2005). Allons-y!" ;;
  "04-03") echo "🕰️ 11th Doctor (Smith) debut (2010). Geronimo!" ;;
  "08-23") echo "🕰️ 12th Doctor (Capaldi) debut (2014)." ;;
  "10-07") echo "🕰️ 13th Doctor (Whittaker) debut (2018)." ;;
  "01-26") echo "🕰️ Fugitive Doctor (Martin) debut (2020)." ;;
  "11-25") echo "🕰️ 14th Doctor (Tennant again!) debut (2023)." ;;
  "04-12") echo "🕰️ 15th Doctor (Gatwa) debut (2025)! The new era has begun." ;;
esac

# Alien & Predator Films
case "$month_day" in
  "05-25") echo "👽 Alien premiered (1979). In space no one can hear you scream." ;;
  "07-18") echo "👽 Aliens premiered (1986). Get away from her, you bitch!" ;;
  "06-12") echo "👹 Predator premiered (1987). If it bleeds, we can kill it." ;;
  "08-05") echo "👹 Prey premiered (2022)." ;;
esac

# Special day calculations
if [ "$day" = "13" ] && [ "$weekday" = "Friday" ]; then
  echo "☠️ Friday the 13th – beware of cursed bugs!"
fi
if [ "$day_of_year" -eq 256 ]; then
    echo "💻 Happy Programmers' Day! (Day 256)"
fi
# Dia de los muertos spans multiple days
if [[ "$month_day" > "10-30" && "$month_day" < "11-03" ]]; then
    echo "💀🕯️ Día de los Muertos. Remembering loved ones."
elif [ "$month_day" = "10-31" ]; then
    echo "🎃 Happy Halloween – beware of ghost bugs in the code."
fi

# Blue Monday and Swiftie February
if [ "$month" = "01" ] && [ "$weekday" = "Monday" ] && [ "$day" -ge 15 ] && [ "$day" -le 21 ]; then
    echo "😞 It's Blue Monday, supposedly the saddest day of the year. Push through!"
fi
if [ "$month" = "02" ] && [ "$weekday" = "Monday" ]; then
    echo "🎶 All my mornings are Mondays stuck in an endless February..."
fi

# --- STEP 4: Hourly & Weekend Greetings ---
if [ "$hour" -eq 13 ] && [ "$minute" -eq 37 ]; then
    echo "👾 13:37 - L33T H4X0R T1M3!"
elif [ "$day" -eq 13 ] && [ "$hour" -eq 13 ] && [ "$minute" -eq 13 ]; then
    echo "🎶 It's 13:13 on the 13th! Ultimate Taylor Swift hour!"
elif (( weekday_num < 6 )); then # It's a weekday (Mon-Fri)
    case "$hour" in
        0) echo "👻 Spooky hour... the code is alive..." ;;
        8|9) echo "☀️ Good morning! Time to conquer the code." ;;
        12|13) echo "🍽️ Lunch time! Step away from the screen." ;;
        16|17) echo "🏁 Almost there — time to wrap it up." ;;
        21) echo "🌆 Time to unwind." ;;
        22|23)
            if [ "$weekday" = "Friday" ]; then
                echo "🎉 It's Friday night! Time to relax or party!"
            else
                echo "😴 Dude, you need to sleep. Workday tomorrow."
            fi
            ;;
    esac
else # It's a weekend (Sat-Sun)
    if [ "$weekday" = "Saturday" ]; then
      echo "🐾 Happy Caturday! The purrfect day for coding... or napping."
    fi
    case "$hour" in
        0) echo "👻 Spooky hour... the code is alive..." ;;
        [0-9]|1) echo "☕ Weekend morning coding session. Nice and quiet." ;; # 0-9
        1[0-7]) echo "🌳 It's the middle of the day. Get out and get some fresh air!" ;; # 10-17
        18|19) echo "❤️ Spend time with your family, dude!" ;;
        20|21) echo "🎮 Gaming and coding time! Enjoy." ;;
        22|23)
            if [ "$weekday" = "Sunday" ]; then
                echo "🌙 Go to sleep, dude. Workday tomorrow."
            else # It's Saturday
                echo "🎉 Saturday night! Party on!"
            fi
            ;;
    esac
fi

# --- STEP 5: Seasonal Vibes + Pagan holidays (Northern Hemisphere) ---
# First, handle month-specific vibes that might overlap seasons
if [ "$month" = "06" ]; then
    echo "🏳️‍🌈 Happy Pride Month! Code with love and pride."
fi
if [ "$month" = "10" ]; then
    echo "🎃 Happy Spooktober! Time for some spooky code."
fi

# Pagan cross-quarter days (mid-season markers) first, so they don't double-print
case "$month_day" in
  "02-01") echo "❄️ Imbolc — mid-winter. Light returns." ;;
  "05-01") echo "🌱 Beltane — mid-spring. Fire, growth and joy." ;;
  "08-01") echo "☀️ Lammas (Lughnasadh) — mid-summer. First harvest." ;;
  "11-01") echo "🍂 Samhain — mid-autumn. The veil thins." ;;
esac

# Season starts (equinoxes/solstices) on the exact day
if   [[ "$month_day" == "03-20" ]]; then
  echo "🌱 Spring Equinox (Ostara) — spring begins!"
elif [[ "$month_day" == "06-21" ]]; then
  echo "☀️ Summer Solstice (Litha) — summer begins!"
elif [[ "$month_day" == "09-22" ]]; then
  echo "🍂 Autumn Equinox (Mabon) — autumn begins!"
elif [[ "$month_day" == "12-21" ]]; then
  echo "❄️ Winter Solstice (Yule) — winter begins!"

# SPRING: Mar 21 – Jun 20
elif [[ "$month_day" > "03-20" && "$month_day" < "06-21" ]]; then
  if   [[ "$month_day" < "04-20" ]]; then
    echo "🌱 Early Spring — fresh starts everywhere."
  elif [[ "$month_day" < "05-20" ]]; then
    echo "🌱 Spring in full swing."
  elif [[ "$month_day" < "06-14" ]]; then
    echo "🌱 Late Spring — summer is coming."
  else
    echo "🌱 Final days of Spring — almost solstice."
  fi

# SUMMER: Jun 22 – Sep 21
elif [[ "$month_day" > "06-21" && "$month_day" < "09-22" ]]; then
  if   [[ "$month_day" < "07-21" ]]; then
    echo "☀️ Early Summer — heat is building."
  elif [[ "$month_day" < "08-21" ]]; then
    echo "☀️ Summer in full swing — peak sunshine."
  elif [[ "$month_day" < "09-15" ]]; then
    echo "☀️ Late Summer — golden hours."
  else
    echo "☀️ Final days of Summer — autumn is near."
  fi

# AUTUMN: Sep 23 – Dec 20
elif [[ "$month_day" > "09-22" && "$month_day" < "12-21" ]]; then
  if   [[ "$month_day" < "10-22" ]]; then
    echo "🍂 Early Autumn — crisp air and turning leaves."
  elif [[ "$month_day" < "11-22" ]]; then
    echo "🍂 Autumn in full swing — cozy nights and coffee."
  elif [[ "$month_day" < "12-14" ]]; then
    echo "🍂 Late Autumn — winter is coming."
  else
    echo "🍂 Final days of Autumn — almost solstice."
  fi

# WINTER: Dec 22 – Mar 19
else
  if   [[ "$month_day" > "12-21" || "$month_day" < "01-21" ]]; then
    echo "❄️ Early Winter — the cold has just begun."
  elif [[ "$month_day" < "02-21" ]]; then
    echo "❄️ Winter in full swing — frosty and focused."
  elif [[ "$month_day" < "03-13" ]]; then
    echo "❄️ Late Winter — spring is around the corner."
  else
    echo "❄️ Final days of Winter — almost equinox."
  fi
fi


# --- STEP 6: Final Sign-off ---
echo "✨ Have a quack day, and don't quack it up!"
echo ""

