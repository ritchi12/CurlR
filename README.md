# CurlR

**CurlR** provides two datasets containing game-level and shot-level data from the Olympic Winter Games and World Mixed Doubles Curling Championships between 2016 and 2025.  
The data were extracted from publicly available Results Books on [CurlIt](https://curlit.com/results) using text scraping and image processing.

---

## 📦 Contents

- **data/**  
  Contains the main datasets:
  - Game-level data  
  - Shot-level data  

- **R/**  
  R functions and scripts for loading, cleaning, and interacting with the data.

- **man/**  
  Documentation for the R functions.

- Package metadata files such as `DESCRIPTION`, `NAMESPACE`, `.Rbuildignore`, etc.

---

## 🚀 Installation

### Install directly from GitHub

```r
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
devtools::install_github("ritchi12/CurlR")
```
Or clone manually
git clone https://github.com/ritchi12/CurlR.git

Then load data as needed:
```r
data("mxd_games")
data("mxd_shots")
```

---

## 📊 Data Overview

###  Game-level dataset

Contains information such as:

<div style="max-height: 350px; overflow-y: auto;">

| Field | Description |
|-------|-------------|
| ID | Tournament identifier, a combination of the abbreviation of the tournament and the year |
| Title | Name of the game, typically round robin or playoff game |
| Game | Increment number for the game; gold medal game is game 1 and the largest number is first round robin game of the tournament |
| Sheet | Sheet label when available |
| T{1,2} | Team names |
| LineScoreT{1,2} | End-by-end breakdown of what each team scored |
| FinalT{1,2} | Score at the conclusion of the game |
| LSFE | Indicator for last stone first end winner |
| T{1,2}_Colour | Stone colour of each team |
| PP_E{1,2} | Identifiers for the ends that had a Power Play |
| Left_PP_E{1,2} | Indicator for whether the Power Play was on the left side of the sheet |
| T{1,2}{F,M}Name | Name of team member by gender |
| T{1,2}{F,M}{Draws,TO,Total}{Clock,Counter}Num | Number of shots per team member per shot type or total for the tournament, separated by stone rotation |
| T{1,2}{F,M}{Draws,TO,Total}{Clock,Counter}Percent | Outcome percentages of shots per team member per shot type or total for the tournament, separated by stone rotation |
| T{1,2}{F,M}{Draws,TO,Total}GameNum | Total number of shots per team member per shot type or total for the tournament thus far |
| T{1,2}{F,M}{Draws,TO,Total}GamePercent | Outcome percentages of total shots per team member per shot type or total for the tournament thus far |
| T{1,2}{Draws,TO,Total}{Clock,Counter}Num | Number of shots per team per shot type or total for the tournament thus far, separated by stone rotation |
| T{1,2}{Draws,TO,Total}{Clock,Counter}Percent | Outcome percentages of shots per team per shot type or total for the tournament thus far, separated by stone rotation |
| T{1,2}{Draws,TO,Total}GameNum | Total number of shots per team per shot type or total for the tournament thus far |
| T{1,2}{Draws,TO,Total}GamePercent | Outcome percentages of total shots per team per shot type or total for the tournament thus far |
| T{1,2}{F,M,Total}Game | Number of shots per team member for the game |
| T{1,2}{F,M,Total}All | Outcome percentages of shots per team member for the tournament thus far |
| T{1,2}Mins | Minutes remaining on the shot clock at the end of the game by team |
| T{1,2}Secs | Seconds remaining on the shot clock at the end of the game by team |
| EE-T{1,2}Mins | Extra ends minutes remaining on the shot clock at the end of the game |
| EE-T{1,2}Secs | Extra ends seconds remaining on the shot clock at the end of the game |
| T{1,2}Time-out{1,2}_End | Time-out end that the team called each of their two time-outs |
| T{1,2}Time-out{1,2}_Shot | Time-out shot number that the team called each of their two time-outs |
| T{1,2}_{F,M}_LSFE_Turn | Last stone draw rotation per team member |
| T{1,2}_{F,M}_LSFE_Distance | Last stone draw distance to the pin per team member |
| T{1,2}_LSFE_TotalDistance | Team's cumulative last stone draw distance to the pin |

</div>


### Shot-level dataset

Contains information such as:

<div style="max-height: 350px; overflow-y: auto;">
  
| Field | Description |
|-------|-------------|
| ID | Tournament identifier, a combination of the abbreviation of the tournament and the year |
| Title | Name of the game, typically round robin or playoff game |
| Game | Increment number for the game; gold medal game is game 1 and the largest number is the first round robin game |
| Sheet | Sheet label when available |
| T{1,2} | Team names |
| T{1,2}_Colour | Stone colour of each team |
| T{1,2}{F,M}Name | Names of the female and male members of each team |
| LSFE | Indicator for last stone first end winner |
| End | Number of the end |
| Hammer_End | Name of the team with hammer possession in the end |
| Shot | Number of the shot; 0 indicates pre-positioned stones |
| Rock_Country | Name of the team throwing the stones |
| Rank | Final standing ranking (1 = tournament winner, −1 = disqualified) |
| Gender | Gender of the player throwing the shot |
| Thrower | Name of the player throwing the shot |
| Handedness | Handedness of the thrower |
| Throw | Type of throw (e.g., Draw, Take-out, etc.) |
| Turn | Rotation of the throw |
| Percent | Shot score (25%, 50%, 75%, or 100%) |
| {R,Y}{1,2,3,4,5,6}{X,Y} | Shot identifier: combination of rock colour, number, and X/Y coordinate. Number reflects algorithm-detected order, not shot order |
| ShooterCol | Colour of the shooter stone; shooter is identified by bold outline or center dot |
| Shooter{X,Y} | Coordinates of the shooter stone |
| {Left,Right}\_PP | Indicator for whether the Power Play was on the left or right side |
| PowerPlay | Indicator for whether the end is a Power Play |
| PP_Team | Team that called the Power Play (the hammer team) |
| T{1,2}\_has_PP_available | Whether the team still has a Power Play available in that end (1 also when team lacks hammer and cannot use it) |
| T{1,2}Before | Score for the team prior to the end |
| T{1,2}During | Points scored in the end; “X” if the game was conceded during the end |
| T{1,2}After | Score after the end (Before + During); “X” if the game was conceded |
| FinalT{1,2} | Score at the conclusion of the game |
| {Red,Yellow}\_Score | Number of stones of that colour in the house and closer to the pin than any opponent stone (shot result) |
| {Red,Yellow}\_House | Number of stones of that colour in the house |
| {Red,Yellow}\_Button | Number of stones of that colour on the button |
| {Red,Yellow}\_{4,8,12}FT | Number of stones of that colour in the 4-ft, 8-ft, or 12-ft ring |
| {Red,Yellow}\_W{1,...,10} | Number of stones in the playing zone by weight class (see zone definitions) |
| {Red,Yellow}\_G{L,C,R} | Number of stones in the playing zone by guard side (Left, Center, Right) |

</div>

---

## 📄 License
This project is released under the CC0 1.0 Universal (CC0) Public Domain Dedication.
You may copy, modify, distribute, and use the work — including for commercial purposes — without permission.

---

## ⚠️ Data Source & Disclaimer
Data were extracted from publicly available Results Books on [CurlIt](https://curlit.com/results).

Extraction involved text scraping and image processing. While care was taken to ensure accuracy, errors or omissions may exist.

Users are encouraged to verify critical data before using it for publications or decisions.

---

## 🔧 Contributing
Contributions are welcome!

You can help by:

- Writing new helper functions

- Reporting errors or inconsistencies

Please make sure:

- Changes follow the existing style

- New functions include documentation and export settings

- Open an issue or submit a pull request to contribute.

---

## 📫 Contact
For questions, suggestions, or issues, please open an Issue on the GitHub repository.

## 🧾 Acknowledgments
Data sources: curlit.com

Created and maintained by the repository author and contributors
