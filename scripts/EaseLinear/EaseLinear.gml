///@arg EaseLinear(current-time,duration,start-value,change-in-value,[absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * argument[0] / argument[1] + argument[2];