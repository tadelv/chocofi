# chocofi

Keyboard shield and 3d printed case to use with Arduino ProMicro-like contoller.

![Photo of a chocofi keyboard](/pictures/IMG_7067.jpeg)

- Split keyboard with 3 rows, 5 columns, and 3 thumbs per half
- Increased pinky column stagger
- Inspired by [Fifi keyboard](https://github.com/raychengy/fifi_split_keeb)
- Double-sided pcb (pcb can be used as left or right half)
- Pro Micro compatible footprint
- Easy to print, FDM-friendly two-piece case

## Artifacts

Hotswap PCB

[IBOM](https://htmlpreview.github.io/?https://github.com/krikun98/chocofi/blob/main/pcb/hotswap/bom/ibom.html)

[gerbers](../../releases/latest/download/pcb_hotswap_gerbers.zip)

front|back
--|--
![front](../../releases/latest/download/pcb_hotswap.png)|![back](../../releases/latest/download/pcb_hotswap_back.png)

[Plate gerbers](../../releases/latest/download/gerber_case_files.zip)

Stls are here: [case folder](/case)

For more photos check out the [pictures folder](/pictures)

## By the way

Recommended batteries:

- [Nice nano docs](https://nicekeyboards.com/docs/nice-nano/#recommended-batteries-and-sockets) explains some basics
- [nRFmicro wiki](https://github.com/joric/nrfmicro/wiki/Batteries#301230) contains links to Aliexpress

Awesome libs used:

- [kbd.pretty](https://github.com/krikun98/kbd) by foostan & krikun98
- [keyswitches.pretty](https://github.com/daprice/keyswitches.pretty) by daprice
- [Buttons_Switches.pretty](https://github.com/ElessarCuthalion/KiCAD_library/tree/master/Buttons_Switches.pretty) by ElessarCuthalion

Also closest alternatives are:

- [raychengy/fifi](https://github.com/raychengy/fifi_split_keeb): non choc (mx switches)
- [davidphilipbarr/chocorne](https://github.com/davidphilipbarr/36keys/tree/master/42Keys/chocorne): non hotswap but choc-spaced corne (you can break off one column so it will be 5x3, but with corne pinky stagger)
