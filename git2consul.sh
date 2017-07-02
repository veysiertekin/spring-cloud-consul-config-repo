# Go to current directory
tmp_dir=$(pwd)
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load consul configuration
. ./git-and-consul.config

cat <<EOF > /tmp/git2consul.json
{
  "version": "1.0",
  "repos" : [{
    "name" : "config",
    "url" : "${gitRepository}",
    "source_root": "${gitSourceRoot}",
    "branches" : ["${gitBranch}"],
    "include_branch_name": false,
    "expand_keys": true,
    "ignore_file_extension": true,
    "variables_enabled": false,
    "hooks": [{
      "type" : "polling",
      "interval" : "1"
    }]
  }]
}
EOF

eval "git2consul --endpoint ${consulHost} --port ${consulPort} --config-file /tmp/git2consul.json"

# Restore previous folder
cd "$tmp_dir"