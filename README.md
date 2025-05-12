# TAM2R

Tool Assisted Metroid 2 Recorder is a work-in-progress mod that allows recording inputs and playing them back seamlessly.

As of now this is about all it can do, but the scope is planned to expand to include more TAS tools like savestates, frame-by-frame input editing, and a piano-roll stlye external input file editor.



## Notes

- ### Your vanilla save files and configs mey get deleted by this mod! Back them up if this is a concern!
- You can press F1 to toggle the level of information when recording or playing back an input file. By default it's at full. The levels are:
    - 0: Nothing
    - 1: Frame count + minimal input display
    - 2: L1 + Position and velocity readouts
    - 3: L2 + Controller style input display.
- Input files are recorded to `%localappdata%/AM2R/rec.txt`. Starting a new recording will overwrite this, so copy it out if you want to keep hold of a file!
- This mod has a way to automatically set up your config and save when the game starts. To use this, go to `%localappdata%/AM2R/` and create a folder titled `tas-preset-files`. Any file in your main AM2R named `sav1`, `sav2`, `sav3`, and `config.ini` will be overwritten by the copies in this new folder. If there are any files named `~sav1`, `~sav2`, `~sav3`, or `~config.ini`, the game will delete the file it's named after, allowing you to have empty saves and configs. For example, this directory structure will leave you with an empty first save slot, your original second save slot, your new 3rd save slot, and overwrite your config.ini with the new one.
```
AM2R/
├── sav1
├── sav2
├── config.ini
└── tas-preset-files/
    ├── ~sav1
    ├── sav3
    └── config.ini
```

