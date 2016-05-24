#slasher
The Slasher project only consists of Slashbot at this time, but may grow


## Slashbot
Slashbot responds to specific Slack commands initiated by the EU team.



### /iam

**Purpose:** team member sets status<br>
**Usage:** `/iam going to lunch`

Slashbot records status in file [team_status/team_status.json](team_status/team_status.json.example) and posts status in channel where command was entered.<br>
![Output of /iam going to lunch](/readme_img/iam-status.jpg?raw=true)



### /sup
**Purpose:** retrieve latest status for team member<br>
**Usage:** `/sup [@andy]`

Slashbot retrieves and displays last status and time elapsed for all users.<br>
![Output of /sup @andy](/readme_img/sup-all.jpg?raw=true)

By supplying the optional @username parameter, you can retrieve the status for a single team member.<br>
![Output of /sup](/readme_img/sup-andy.jpg?raw=true)


## Install / config
- Rename `_valid_tokens.inc.example` -> `_valid_tokens.inc`
- Rename `team_status/team_status.json.example` -> `team_status.json`
- Rename `team_status/team_status.settings.example` -> `team_status.settings`
- Add Slack slash command token(s) to array in `_valid_tokens.inc`
- Add path to file containing team status json array in `team_status/team_status.settings`
- Upload files to a location with a valid SSL cert. This is a Slack pre-requisite. [More about that here](https://api.slack.com/slash-commands#ssl).

- Go to [yourslackteam].slack.com/apps/manage/custom-integrations
- Open `Slash Commands`
- Then for each slash command choose `Add Configuration`
- The settings should look something like this:
![Slack slash command settings](/readme_img/slack-slash-command-settings.jpg?raw=true)

