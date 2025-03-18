import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  getDisplayMetrics(): DisplayMetrics;
}

export default TurboModuleRegistry.getEnforcing<Spec>('PpiSize');

export interface DisplayMetrics {
  /**
   * The device Manufacturer
   * @example Apple
   */
  brand: string;

  /**
   * device model
   *
   * @example iPhone17,2
   *
   */
  device_model: string;

  /**
   * Screen width of px
   * @example 1080
   */
  width: number;

  /**
   * Screen height of px
   * @example 1920
   */
  height: number;

  /**
   * the density of the screen
   * Note:
   *   The ppi value of Android devices is based on the diagonal of screen.
   *   May have different density in X and Y dimension.
   * @example 460
   *
   */
  ppi: number;

  /**
   * The density of the screen in the X dimension
   */
  x_ppi: number;

  /**
   * The density of the screen in the Y dimension
   */
  y_ppi: number;
}
