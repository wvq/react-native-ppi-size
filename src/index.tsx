import { PixelRatio } from 'react-native';
import PpiSize, { type DisplayMetrics } from './NativePpiSize';

let displayMetrics: DisplayMetrics | null = null;

export function getDisplayMetrics(): DisplayMetrics {
  if (displayMetrics !== null) {
    return displayMetrics;
  }

  displayMetrics = PpiSize.getDisplayMetrics();

  if (displayMetrics.ppi === -1) {
    displayMetrics = {
      brand: 'Unknown',
      device_model: 'Unknown',
      width: -1,
      height: -1,
      ppi: -1,
      x_ppi: -1,
      y_ppi: -1,
    };

    console.warn(
      'react-native-ppi-size: getDisplayMetrics error, fallback to `PixelRatio.get()`, \nplease issue to https://github.com/wvq/react-native-ppi-size/issues'
    );
  }

  return displayMetrics;
}

export function scale(size: number, ppi = 160) {
  if (displayMetrics == null) {
    getDisplayMetrics();
  }

  if (displayMetrics!.x_ppi === -1) {
    return size;
  }

  let reactRatio = PixelRatio.get();

  let ppiRatio = displayMetrics!.x_ppi / ppi;

  return (size * ppiRatio) / reactRatio;
}
