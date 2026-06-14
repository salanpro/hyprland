qemu-system-x86_64 \
  -enable-kvm \
  -m 6G \
  -cpu host \
  -smp 4 \
  -drive file=~/scripts/kali/kali-linux-2026.1-qemu-amd64.qcow2,format=qcow2 \
  -net nic -net user,hostfwd=tcp::2222-:22 \
  -vga virtio \
  -display gtk,gl=on
