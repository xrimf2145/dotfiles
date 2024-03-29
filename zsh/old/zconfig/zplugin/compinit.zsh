#function _pip_completion {
#  local words cword
#  read -Ac words
#  read -cn cword
#  reply=( $( COMP_WORDS="$words[*]" \
#             COMP_CWORD=$(( cword-1 )) \
#             PIP_AUTO_COMPLETE=1 $words[1] ) )
#}
#compctl -K _pip_completion pip3
#
##compdef -P qemu(|-system-*)
#
#_qemu_log_items () {
#  local -a opts hline
#  $service -d \? 2>/dev/null | while read -A hline; do
#    [[ $hline[1] = Log ]] && continue
#    opts=($opts "${hline[1]}[${hline[2,-1]}]")
#  done
#  _values -s , 'log items' $opts
#}

#local _qemu_machines

#_qemu_machines=(${${${(f)"$($service -M \? 2>/dev/null)"}[2,-1]}%% *})

#_arguments \
#  '-'{fda,fdb,hda,hdb,hdc,hdd,cdrom}':disk image:_files' \
#  '-M[target machine]:machine:('"${_qemu_machines:-none}"')' \
#  '-boot[specify which image to boot from]:boot device:((a\:floppy\ image\ a c\:hard\ disk d\:cdrom))' \
#  '-snapshot[write to temporary files instead of disk image files]' \
#  '-no-fd-bootchk[disable boot sig checking for floppies in Bochs BIOS]' \
#  '-m[virtual RAM size (default=128)]:megs:' \
#  '-smp[set the number of CPUs (default=1)]:number of CPUs:' \
#  '-nographic[disable graphical output]' \
#  '-vnc[listen on VNC display]:display:' \
#  '-k[use keyboard layout]:keyboard layout language:(ar de-ch es fo fr-ca hu ja mk no pt-br sv da en-gb et fr fr-ch is lt nl pl ru th de en-us fi fr-be hr it lv nl-be pt sl tr)' \
#  '-audio-help[show audio subsystem help]' \
#  '-soundhw[enable audio and selected sound hardware]:cards to enable:(all)' \
#  '-localtime[set rtc to local time]' \
#  '-full-screen[start in full screen]' \
#  '-pidfile:pidfile:_files' \
#  '-win2k-hack' \
#  '-usb[enable USB driver]' \
#  '-usbdevice:usb device:' \
#  '-net:net config:(none)' \
#  '-tftp[allow tftp access to files starting with prefix]:tftp prefix:_files' \
#  '-smb[allow SMB access to files in specified directory]:samba directory:_path_files -/' \
#  '-redir[redirect TCP or UDP connections from host to guest]:redirection: ' \
#  '-kernel[boot specified linux kernel]:kernel image:_files' \
#  '-append[use specified kernel command line]:command line: ' \
#  '-initrd[use specified initial ram disk]:ram disk:_files' \
#  '-serial:dev:(vc stdio pty null /dev/ttyS0 /dev/partport0)' \
#  '-parallel:dev:(vc stdio pty null /dev/ttyS0 /dev/partport0)' \
#  '-monitor:dev:(vc stdio pty null /dev/ttyS0 /dev/partport0)' \
#  '-s[wait gdb connection to port 1234]' \
#  '-p[change gdb connection port]:port:_ports' \
#  '-S[do not start CPU at startup]' \
#  '-d[output log in /tmp/qemu.log]:log items:_qemu_log_items' \
#  '-hdachs[force hard disk 0 geometry (usually qemu can guess it)]:hd0 geometry c,h,s:' \
#  '-vga[select video card type]:card type:(std cirrus vmware qxl xenfb none)' \
#  '-no-acpi[disable ACPI]' \
#  '-loadvm[start right away with a saved state]:file:_files' \
#  '-g[set initial graphic mode]:graphic mode:' \
#  ':disk image:_files'
