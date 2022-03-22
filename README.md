# Discord_Webhook

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Description
This is a webhook shell script for Discord only. The script was born since I wish a recurring reminder bot. But there are no suitable free bots after I survey on the internet. Hence, I have decided to write a simple webhook script and integrate it into the daemon on the OS.

To achieve the purpose I wanted, I need a scheduling utility to help. For Linux users, you could trigger the shell by `crontab`. Please refer to the article, [How to make a schedule to clean logs on Linux ?](https://nick10811.github.io/2016/05/09/how-to-make-schedule-to-clean-logs-on/), I wrote. For macOS users, I also wrote an article, [Daemon programming on macOS](https://nick10811.github.io/2022/03/05/Daemon-programming-on-macOS/), to illustrate the daemon.

## Usage
Before executing this script, you need to get the [webhook URL](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) from Discord. Execute script and replace the `<webhook_url>` in the command below.

```bash
$ ./run.sh --url <webhook_url>
```

### Execute bash script from URL

```bash
$ curl -s https://raw.githubusercontent.com/nick10811/Discord_Webhook/master/run.sh | bash -s -- -u <webhook_url>
```

This lists all command of the options.

```bash
$ ./run.sh --help
Usage: ./run.sh [options...]
-u, --url            The url of webhook (requirement)
-t, --title          The title
-m, --message        The message (requirement)
-h, --help           Get help for commands


--username           The name of Bot
--tag                For user mentions
--avatar             The url of avatar
--color              The integer of color, default is gold(15844367)

```

You could mention users in the message if you obtain the [UserID](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID-).

```bash
$ ./run.sh --url <webhook_url> --tag "<@here>" # mention in channel
$ ./run.sh --url <webhook_url> --tag "<@UserID>" # mention users
$ ./run.sh --url <webhook_url> --tag "<@&RoleID>" # mention roles
```

> You could modify this script if it is not suitable for your requirements. Please refer to the [official document](https://discord.com/developers/docs/resources/webhook#execute-webhook) to edit it.

## Integrate into the schedule jobs
In order to make a recurring reminder, we make a schedule to execute the script. I made two examples in the Example folder that will execute at 12PM every weekend. For Linux users, you could copy the content of cron into `/etc/crontab`. For macOS users, there is a `.plist` for you. You could place it in the `/Library/LaunchDaemons/` to execute by the system booting. Or place it in the `/Library/LaunchAgents/` to execute by user logging-in.

## Author
* **Nick Yang** - [nick10811](https://github.com/nick10811)