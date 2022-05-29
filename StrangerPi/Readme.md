# Stranger Pi based on CustomPiOS

## Preparation

```
yay -S manjaro-qemu-arm-static qemu-arm-static-bin
sudo systemctl restart systemd-binfmt
```

## Build

Just run:

```bash
sudo GET_IMAGE=1 src/build_dist
```

And on the next runs, to prevent re-downloading the image, do NOT set GET_IMAGE.
