# react-native-ppi-size

Scales the size based on the device's ppi,
make size looks same physical size across different devices.

Consider two device, ppi is 400 and 460, but both `PixRatio.get()` is `3`,

Using dp size both scaled by `3`, it looks different, on low-resolution may be too big, on high-resolution may be too small.

## Note
only support  New Architecture.

## Installation

```sh
npm install react-native-ppi-size
```

## Usage


```ts
import { scale, getDisplayMetrics } from 'react-native-ppi-size';

// scale size based on the device's ppi, default PPI = 160
const size = scale(100);

// custom ppi value
const PPI = 150;
const size = scale(100, PPI);
```


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
