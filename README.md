# Twitter in Terminal using `twurl`

## Requirement

- Bash (or zsh)
- twurl: https://github.com/twitter/twurl
    - commandline tool for Twitter API
- jq: http://stedolan.github.io/jq/
    - json filter
- PATH `./bin`

## `tw`: post

```bash
$ tw hoge hoge # post "hoge hoge"
$ date | tw # post $(date)
```

```bash
$ tw
a b
c  d
^D # post "a b\nc  d"
```

### post via vim

```vim
:w !tw
```

### make your own tweet window

```bash
rlwrap sh -c 'while read a; do tw "$a"; done'
```

type <Ctrl-D> to exit

## `tw-media`: post with an image

```bash
tw-media <text> <image>
```

1. `text` can be ommited
1. `image` is specified by URL or local path

the image on web is stored to `/tmp` by `wget`

## `tw-rep-url`: post a reply with image

画像のurlを指定して画像付きでリプライをする

```bash
tw-rep-url <scren_name> <status_id> <image-URL>
```

`screen_name` and `status_id` is of the destination

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
### `tw-mentions`: mentions
### `tw-dms`: DMs

### `tw-stream`: UserStream

`tw-stream` is unstable

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

## Post forecast of Hongo

Get and post

```bash
tw-tenki
```

## Tips

### Get a information of a user

```bash
twurl /1.1/users/show.json?screen_name=cympfh | jq .
```

# Future Work

- UserStream 全部で通してマージできるかな
- 全部のアカウントのメンション、タイムラインの取得、マージ

