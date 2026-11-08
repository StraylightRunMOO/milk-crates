@verb pkg:status this none none rxd
@program pkg:status
// $pkg:status
// Installed packs recorded on #0.eigen_packages.
pkgs = `$eigen_packages ! ANY => []';
if (typeof(pkgs) != MAP)
  pkgs = [];
endif
return ["ok" -> 1, "installed" -> pkgs, "git" -> this:has_git(), "catalog" -> length(this.catalog)];
.
