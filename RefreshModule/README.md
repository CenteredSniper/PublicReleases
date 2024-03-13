# Refresh Module

I created this because I see a lot of people making tons of mistakes when it comes to refreshing; such as
> Only looking for one specific part of the body (Torso, HumanoidRootPart) that may be missing which causes error clutter

> Running the teleport on the server (which has desync causing a rubberband upon refresh, especially apparent with higher ping)

> Not teleporting the camera (which is jarring)

My module attempts to fix many of these issues, though it may not be perfect, it's marginally better then the typical refresh I've seen people make

## Setup

Require the module with a localscript and do the method `:Refresh()`

Modify the code if you want the remote to be placed elsewhere, it automatically creates a remote in the script

## Example

https://github.com/CenteredSniper/PublicReleases/assets/59752762/ef5dd464-5fb8-4098-9b35-70f10f2598b4

## Known Issues

> workspace.SignalBehavior Deferred

My code relies heavily on Signals to work on the Immediate Behavior, so Player.CharacterAdded runs around the same time as Player.CharacterRemoving, causing the code to yield. 

The easiest fix for this would be to change the SignalBehavior until I can find a solution.

> Animations get reset, being noticable

Honestly, implementing a whole thing to make animations fluidly refresh would be a lot of hassle especially with how... horrid... animation modification is.

Then there's the hassle of dealing with the Animate script, and then replication, etc etc

A lot of work for nothing.
