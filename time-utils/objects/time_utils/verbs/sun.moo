@verb time_utils:sun this none this rxd
@program time_utils:sun
// $time_utils:sun([time]) => INT
// Integer solar altitude at time (default time()), from this.corr/stsd/ctcd/ct and $trig_utils.
{?time = time()} = args;
r = 10000;
h = r * r + r / 2;
t = (time + 120) % 86400 / 240;
s = 5 * ((time - 14957676) % 31556952) / 438291;
phi = s + t + this.corr;
cs = $trig_utils:cos(s);
spss = ($trig_utils:sin(phi) * $trig_utils:sin(s) + h) / r - r;
cpcs = ($trig_utils:cos(phi) * cs + h) / r - r;
return (this.stsd * cs - this.ctcd * cpcs - this.ct * spss + h) / r - r;
.
