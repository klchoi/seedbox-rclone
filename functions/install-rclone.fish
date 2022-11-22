function install-rclone
  set -l current (rclone --version 2>/dev/null | head -n1)
  set -l latest (curl -fsS https://downloads.rclone.org/version.txt)
  if test "$current" != "$latest"
    string match -q -r '(?<v>v.*)' -- $latest
    dpkg -i https://downloads.rclone.org/$v/rclone-$v-linux-amd64.deb
  end
end
