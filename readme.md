#slasher
The Slasher project only consists of Slashbot at this time, but may grow


## Slashbot
Slashbot responds to specific Slack commands initiated by the EU team.



### /iam

**Purpose:** team member sets status
**Usage:** `/iam going to lunch`

Slashbot records status in file ***team_status/team_status.json*** and posts status in channel where command was entered,
e.g `Status update: Andy is going to lunch`



### /sup
**Purpose:** retrieve latest status for team member
**Usage:** `/sup @andy`

Slashbot retrieves and displays last status and time elapsed,
e.g. `Last I heard, Andy was going to lunch, but that was 45 minutes ago.`

`/sup` with no parameter returns status for all team members

#### To Do:
- When retrieving all team updates, order by most recent
- Remove unnecessary "*and*" from response when status was updated less than 1 minute ago



## Install / config
### In Slack
- Go to [yourslackteam].slack.com/apps/manage/custom-integrations
- Open `Slash Commands`
- Then for each slash command choose `Add Configuration`
- The settings should look something like this:
![Slack slash command settings](/readme_img/slack-slash-command-settings.jpg?raw=true)

### Code
- Clone locally, then:
- Rename `_valid_tokens.inc.example` -> `_valid_tokens.inc`
- Rename `team_status/team_status.json.example` -> `team_status.json`
- Rename `team_status/team_status.settings.example` -> `team_status.settings`
- Add path to file containing team status json array in `team_status/team_status.settings`
- Add Slack slash command token(s) to array in `_valid_tokens.inc`
- Upload files to a location with a valid SSL cert. This is a Slack pre-requisite. [More about that here](https://api.slack.com/slash-commands#ssl).

