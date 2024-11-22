Powershell shortcut to changing screen orientation (Windows 7+ only)

## Action
If your screen orientation is standard landscape calling `CO.cmd` will rotate the screen display 90° *counter clockwise* to portrait.
Calling the script again will rotate the screen display 90° clockwise back to landscape.

To ease the use create a shortcut to `CO.cmd` on the desktop. Change the shortcut key to something unused (like [Shift]+[Ctrl]+[Alt]+[F12])

If you want an all-in-one script solution try [All-in-one](https://github.com/Clicketyclick/ChangeScreenOrientation/tree/All-in-one)

## Clockwise
Ben F. wrote:
>  I would much prefer it if it rotated clockwise to begin with and then rotates back counter-clockwise on the second run.

The trick lays in the function:
```ps
DEVMODE dm = GetDevMode();
```
Which read the current screen mode.
The "switching" is made in the following switch() 🐏
```ps
                // determine new orientation based on the current orientation
                switch(dm.dmDisplayOrientation)
                {
                    case NativeMethods.DMDO_DEFAULT:
                        //dm.dmDisplayOrientation = NativeMethods.DMDO_270;
                        //2016-10-25/EBP wrap counter clockwise
                        dm.dmDisplayOrientation = NativeMethods.DMDO_90;
                        break;
                    case NativeMethods.DMDO_270:
                        dm.dmDisplayOrientation = NativeMethods.DMDO_180;
                        break;
                    case NativeMethods.DMDO_180:
                        dm.dmDisplayOrientation = NativeMethods.DMDO_90;
                        break;
                    case NativeMethods.DMDO_90:
                        dm.dmDisplayOrientation = NativeMethods.DMDO_DEFAULT;
                        break;
                    default:
                        // unknown orientation value
                        // add exception handling here
                        break;
                }
```
The logic is:
1. If orientation is DMDO_DEFAULT (landscape) switch to DMDO_90 (Anti-clockwise)
2. If orientation is DMDO_90 (Anti-clockwise) switch to DMDO_DEFAULT (landscape)

So if you want to rotate clockwise and back set:
```ps
      case NativeMethods.DMDO_DEFAULT:
          dm.dmDisplayOrientation = NativeMethods.DMDO_270;
          break;
      case NativeMethods.DMDO_270:
          dm.dmDisplayOrientation = NativeMethods.DMDO_DEFAULT;
          break;
```

