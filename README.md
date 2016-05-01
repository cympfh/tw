# Twitter in Terminal using `twurl`

## Requirement

- Bash (or zsh)
- twurl: https://github.com/twitter/twurl
    - commandline tool for Twitter API
- jq: http://stedolan.github.io/jq/
    - json filter
- PATH to `./bin`

## `tw`: post

```
   tw --help
Usage: tw [options] [<string>]

tw posts <string> to Twitter.
When - is specified as <string>, stdin is read.

Options:
  -f <image>      upload an image file, specified url or local-path
  -r <status_id>  in_reply_to ("@screen_name" isnt appended automatically)
                  (hint: <status_id> allows the url of a status)
```

```bash
tw abc  123 # post "abc 123"
date | tw - # post $( date )
tw -f http://example.com/awesome.gif # post an image
tw -f ./lgtm.gif # post an image
tw -r 111113000 "@my_friend lgtm" # post "@my_friend lgtm" to 111113000
tw -r 111113000 -f ./lgtm "@my_friend"
```

### make your own tweet window

```bash
rlwrap sh -c 'while read a; do tw "$a"; done'
```

type <Ctrl-D> to exit

## manage your accounts

### `tw-auth`: add new account

`consumer key/secret` is written in `tw-auth` (modify if you want)

This is a simple alias of `$TWURL authorize`.

### `tw-ls`: check your accounts and logined

```bash
tw-ls
```

### `~/.twurlrc`

All information of your accounts is written in this file (by `twurl`).

### `tw-cd`: logout and login as another account

```bash
tw-cd <screen_name>
```

`screen_name` can be checked with `tw-ls`

## Get your timeline

The following commands get your timeline of logined.
Call without args.

### `tw-home`: home timeline

call without args

```sh
tw-home
```

### `tw-mentions`: mentions
### `tw-dms`: DMs

### `tw-stream`: UserStream

`tw-stream` is unstable

## Get someone's timeline

call `tw-home` with an arg

```sh
tw-home <screen_name>
```

like `tw-home cympfh`

## `tw-fav-list`: Get your all favorites

returns all favorites' `status_id`

```bash
tw-fav-list
```

## `tw-unfav`: destroy your favorite

```bash
tw-unfav <status_id>
```

## Make new friend and Destroy

```bash
tw-follow <screen_name>
tw-unfollow <screen_name>
```

## Tips

### Get a information of a user

```bash
twurl /1.1/users/show.json?screen_name=cympfh | jq .
```

# Future Work

- UserStream 全部で通してマージできるかな
- 全部のアカウントのメンション、タイムラインの取得、マージ

