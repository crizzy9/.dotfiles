import numpy as np
from PIL import Image


def change_color(source_path, dest_path, source_color, target_color):
    im = Image.open(source_path)
    data = np.array(im)
    r1, g1, b1 = source_color  # Original
    r2, g2, b2 = target_color  # New

    red, green, blue = data[:, :, 0], data[:, :, 1], data[:, :, 2]
    mask = (red == r1) & (green == g1) & (blue == b1)
    data[:, :, :3][mask] = [r2, g2, b2]

    im = Image.fromarray(data)
    im.save(dest_path)


if __name__ == "__main__":
    arch_path = "./sekiro_grub_theme/Sekiro/icons/arch.png"
    arch_tpath = "./sekiro_grub_theme/Sekiro/icons/arch1.png"
    change_color(arch_path, arch_tpath, (255, 255, 255), (23, 147, 209))

    ubuntu_path = "./sekiro_grub_theme/Sekiro/icons/ubuntu.png"
    ubuntu_tpath = "./sekiro_grub_theme/Sekiro/icons/ubuntu1.png"
    change_color(ubuntu_path, ubuntu_tpath, (255, 255, 255), (222, 71, 20))

    windows_path = "./sekiro_grub_theme/Sekiro/icons/windows.png"
    windows_tpath = "./sekiro_grub_theme/Sekiro/icons/windows1.png"
    change_color(windows_path, windows_tpath, (255, 255, 255), (0, 119, 211))

    windows11_path = "./sekiro_grub_theme/Sekiro/icons/windows11.png"
    windows11_tpath = "./sekiro_grub_theme/Sekiro/icons/windows111.png"
    change_color(windows11_path, windows11_tpath, (255, 255, 255), (0, 119, 211))
