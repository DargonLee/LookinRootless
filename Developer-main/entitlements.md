# base entitlements

all binaries of jailbreak are sandboxed(containerized) by default, 
and usually you don't want this, so you need to add the following entitlements:

```
<key>platform-application</key>
<true/>
<key>com.apple.private.security.no-sandbox</key>
<true/>
<key>com.apple.private.security.storage.AppBundles</key>
<true/>
<key>com.apple.private.security.storage.AppDataContainers</key>
<true/>
```

# data sharing via file in tweak

except for /var/ in jbroot, your tweak may not be able to modify(write) files in other jailbreak directories(even through libSandy). 
generally your tweak don't need do this, we recommend that you stored all data of jailbreak app/binary/tweak in /var/ in jbroot.
in some case if you really need to do this, you can write a daemon to handle it.


# reserved directory in jbroot

the /System directory in jbroot is reserved, it is mainly used to [mirror some important files from the original rootfs](filemirror.md), 
and we recommend that you should not store any jailbreak files in it.


