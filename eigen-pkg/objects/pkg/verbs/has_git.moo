@verb pkg:has_git this none none rxd
@program pkg:has_git
// $pkg:has_git
// True when git_clone is a registered builtin (-DEIGENMOO_GIT=ON).
return typeof(`function_info("git_clone") ! ANY => 0') == LIST;
.
