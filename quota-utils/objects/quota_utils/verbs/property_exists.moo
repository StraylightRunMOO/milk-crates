@verb quota_utils:property_exists this none this rxd
@program quota_utils:property_exists
// $quota_utils:property_exists(object, property) => INT
// this:property_exists(object, property)
// => does the specified property exist?
return !!`property_info(@args) ! ANY';
.
