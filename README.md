# github-runner
Our custom docker image used for self hosted gh runners

It requires you to have setup a github PAT with these scopes:
* `repo`
* `admin:org`

This runner is build to be used on an organizational level, you need to provide these two `env` vars:

```
$ORGANIZATION
$ACCESS_TOKEN
```