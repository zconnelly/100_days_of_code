hterm-notify
============

I use chrome's secure shell https://chrome.google.com/webstore/detail/secure-shell/pnhechapfaindjhompbnflcldabbghjo?hl=en so that I have a terminal in my browser.

This comes with the added benefit of browser notifications. We can finally take advantage of that on the command line with hterm-notify (see file in repo)


### Use Cases


Get notified about a long running command

```bash
long_running_command && hterm-notify "done :D"
```

Poor man's pomodoro timer

```bash
while true; do hterm-notify "take a break"; sleep 300; hterm-notify "okay break's over"; sleep 2500; done;
```

Count sheep to help you sleep
```bash
export i=0; while true; do i=$((i+1)); hterm-notify "$i sheep"; sleep 1; done;
```


### More Generally

You can monitor things really effectively!

```pseudocode
while true;
see if a condition is met
if it is -- send a notification!
loop forever
```
