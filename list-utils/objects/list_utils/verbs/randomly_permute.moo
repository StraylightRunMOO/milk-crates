@verb list_utils:randomly_permute this none this rxd
@program list_utils:randomly_permute
// $list_utils:randomly_permute(list) => LIST
// Shuffled copy (Fisher–Yates via shuffle()).
return shuffle(args[1]);
.
