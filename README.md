# ChangeScreenOrientation
(batch-flavored) Powershell shortcut to changing screen orientation (Windows 7+ only)

## Action
If your screen orientation is standard landscape calling `ChangeOrientation.ps1.cmd` will rotate the screen display 90° counter clockwise to portrait.
Calling the script again will rotate the screen display 90° clockwise back to landscape.

To ease the use create a shortcut to `ChangeOrientation.ps1.cmd` on the desktop. Change the shortcut key to something unused (like [Shift]+[Ctrl]+[Alt]+[F12])


Or just use AutoHotkey.

Also, you don't need to use the cmd header -- it's a valid powershell script still (polyglot)