set -l commands daemon logs ping update inspector open open-many close reload kill close-all state get list-windows active-windows debug graph help

# Main commands
complete -c eww -f
complete -c eww -n "not __fish_seen_subcommand_from $commands" -a "$commands"

complete -c eww -n "__fish_seen_subcommand_from open" -a "(eww list-windows)"
complete -c eww -n "__fish_seen_subcommand_from open-many" -a "(eww list-windows)"
complete -c eww -n "__fish_seen_subcommand_from close" -a "(eww active-windows | cut -d ':' -f 1)"
complete -c eww -n "__fish_seen_subcommand_from get" -a "(eww state | cut -d ':' -f 1)"
complete -c eww -n "__fish_seen_subcommand_from update" -a "(eww state | awk -F ':' '!/EWW/ { print \$1 }')"

# Options
complete -c eww -l debug -d "Write out debug logs. (To read logs, run `eww logs`)"
complete -c eww -l force-wayland -d "Force eww to use wayland. This is a no-op if eww was compiled without wayland support"
complete -c eww -s c -l config -d "override path to configuration directory (directory that contains eww.yuck and eww.(s)css)"
complete -c eww -l logs -d "Watch the log output after executing the command"
complete -c eww -l no-daemonize -d "Avoid daemonizing eww"
complete -c eww -l restart -d "Restar tthe daemon completely before running the command"
complete -c eww -s h -l help -d "Print help"
complete -c eww -s V -l version -d "Print version" 
 
