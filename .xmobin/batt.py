#!/usr/bin/python3

from subprocess import Popen, PIPE

formatString = "{word}: <fc={colour}>{percent}</fc>%"
commandString = "upower -i /org/freedesktop/UPower/devices/battery_BAT0"
out = Popen(commandString, shell=True, stdout=PIPE).stdout.read().decode('UTF-8').split('\n')

for line in out:
	if 'state' in line and not 'dis' in line:
		colour = 'blue'
		word = 'Chg'
	elif 'state' in line:
		word = 'Bat'

	if 'percentage' in line:
		percent = int(line.split()[1].split('%')[0])
		if word == 'Bat':
			if percent < 15:
				colour = 'red'
			elif percent < 50:
				colour = 'yellow'
			else:
				colour = 'green'

print(formatString.format(word=word, colour=colour, percent=percent))
