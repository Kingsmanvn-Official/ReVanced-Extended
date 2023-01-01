class Config:
    REVANCED_APKS_RELEASE_URL = (
        "https://api.github.com/repos/Kingsmanvn-Official/ReVanced-Extended/releases/latest"
    )
    MICROG_RELEASE_URL = (
        "https://api.github.com/repos/inotia00/VancedMicroG/releases/latest"
    )
    REVANCED_CHANGES_URL = (
        "https://api.github.com/repos/inotia00/revanced-patches/compare"
    )

    NOTES = """*≣ Note:*
 ➜ `mindetach.zip` is used to detach play store updates for YT and YT Music for rooted users.
 ➜ `microg.apk` is used for google services and must be installed for non root YT and YT Music."""
    CREDITS_MESSAGE = "Credits to our upstream repository [j-hc/revanced-magisk-module](https://github.com/j-hc/revanced-magisk-module)"

    RELEASE_MESSAGE = """*ReVenced Extended*

📑 *NEW RELEASE* {release_name}

{revanced_version_message}

*What's new:*
{changelogs}

{notes}

📦 *Downloads* 

Non-Root(APK):
{nonroot_files}

{credits_message}
    
[ReVanced-Extended repo](https://github.com/Kingsmanvn-Official/ReVanced-Extended)"""
