if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1];

if (argument[0] < 1/2.75)
{
    return argument[3] * 7.5625 * argument[0] * argument[0] + argument[2];
}
else
if (argument[0] < 2/2.75)
{
    argument[0] -= 1.5/2.75;
    return argument[3] * (7.5625 * argument[0] * argument[0] + 0.75) + argument[2];
}
else
if (argument[0] < 2.5/2.75)
{
    argument[0] -= 2.25/2.75;
    return argument[3] * (7.5625 * argument[0] * argument[0] + 0.9375) + argument[2];
}
else
{
    argument[0] -= 2.625/2.75;
    return argument[3] * (7.5625 * argument[0] * argument[0] + 0.984375) + argument[2];
}