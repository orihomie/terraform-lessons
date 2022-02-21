# Lesson 6

## Resource LifeCycle
Is the option that controls how resource will be created and removed.
`lifecycle`. <br>
`prevent_destroy` — set to `true` should be preventing resource from destruction if operation would have destroyed it. At the moment seems to be bugged and not working correctly.<br>
`ignore_changes` — ignores changes happened in tf files and wont be changing resources in this case.<br>
`create_before_destroy` — creates another resource before destroying first one to support almost zero downtime.

## Almost zero downtime
Along with `create_before_destroy` grants opportunity to set up a server which  wont be down if any update will occur.

