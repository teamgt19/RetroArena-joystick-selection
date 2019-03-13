# RetroArena-joystick-selection <img src="./icon.png" width="48" align="right" />

A script to let the user choose the controllers to use for RetroArch players 1-4. It shows several user-friendly dialog boxes to perform this task. You can set the global and/or the system specific configuration.

The joystick selection has two methods of work:

1. The traditional joystick selection by its index number
2. The new **joystick selection by name method**

The advantage of the selection by name method is that there is no need to care about the joystick connection order. You can configure your "Generic USB SNES gamepad" to be the player1 no matter what USB port you use. Or, better yet, configure your "Fancy Bluetooth joypad" to be the player1 no matter what was the order it was paired or how many USB joysticks are connected.

It was converted for use with [RetroArena](http://odroidarena.com/) only.

## Installation


Some people were having issues with the previous installation procedure, then I changed it to simplify things.

1. If you're on EmulationStation, press `F4` to go to the Command Line Interface.

2. Download the `install.sh` script, and launch it:

```bash
curl https://raw.githubusercontent.com/teamgt19/RetroArena-joystick-selection/master/install.sh -o install.sh
bash install.sh
```

3. The script will automatically download the joystick-selection scriptmodule and install everything you need. After installation you can safely delete the `install.sh` file:

```bash
rm install.sh
```

4. **After that you are ready to use it via RetroArena menu in emulationstation:**

```bash
emulationstation
```


## Update

After installing, you can update it through RetroArena-Setup.

To update the joystick-selection tool, go to RetroArena-Setup and:

*Manage packages* >> *Manage experimental packages* >> *joystick-selection* >> *Update from source*



## Screenshots

**Main menu:**

![main-meu](https://cloud.githubusercontent.com/assets/8508804/17637919/35b71b06-60bd-11e6-91ba-c598aaee806c.png)


**Global configuration (with no configs):**

![config-all-unset](https://cloud.githubusercontent.com/assets/8508804/17637916/35b1c9e4-60bd-11e6-8c58-456c59bbfed0.png)


**Joystick selection screen:**

![joy-select](https://cloud.githubusercontent.com/assets/8508804/17638622/b1f454c8-60c1-11e6-9e10-0fc9debaadcd.png)


**Global configuration (by index method, all 4 joysticks are set):**

![config-all-index](https://cloud.githubusercontent.com/assets/8508804/17637918/35b2e392-60bd-11e6-996b-2a4db69be500.png)


**Global configuration (by name method, all 4 joysticks are set):**

![config-all-configured](https://cloud.githubusercontent.com/assets/8508804/17637912/2d349e72-60bd-11e6-80e5-38460a0b2dd7.png)


**Systems menu (I have just a few of them installed):**

![system-menu](https://cloud.githubusercontent.com/assets/8508804/17637920/35bb4334-60bd-11e6-8926-669ad5b08fa8.png)


**System specific (by index method, some joysticks are set):**

![config-nes-index](https://cloud.githubusercontent.com/assets/8508804/17637921/35bbca48-60bd-11e6-849a-39e835937c24.png)


**System specific (by name method, some joysticks are set):**

![config-nes](https://cloud.githubusercontent.com/assets/8508804/17637917/35b258aa-60bd-11e6-9e01-c64876afb20d.png)



## Known Issues
- If you are using joysticks with equal names, then, yes, the connection order matters.
- **[This issue doesn't happen if you use the joystick selection by name method]** If the joystick list order changes (adding/removing devices), your configuration changes too. So you have to run `joystick_selection.sh` again.
- **[This is RetroArch issue. It doesn't happen because of the joystick selection tool]** Due to the dynamic nature of bluetooth connections, if you configure a bluetooth joystick as Player 1, and somehow lose the connection during a game, if you don't have a keyboard plugged in it'll be annoying to exit RetroArch (connect to RetroArena via ssh and kill RetroArch process. If your raspi isn't on the LAN, :( I think you'll have to unplug your power supply.).
