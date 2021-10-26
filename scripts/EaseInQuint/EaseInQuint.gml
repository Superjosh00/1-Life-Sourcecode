///@arg EaseInQuint(current time,duration,start value,change in value, [absolute = false])

if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * power(argument[0] / argument[1], 5) + argument[2];