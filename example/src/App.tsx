import { Text, View, StyleSheet } from 'react-native';
import { getDisplayMetrics, scale } from 'react-native-ppi-size';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{JSON.stringify(getDisplayMetrics(), null, 2)}</Text>

      <View style={styles.box}>
        <Text style={styles.title}> 200 x 100</Text>
        <Text style={styles.title}> fontSize: 14</Text>
      </View>
      <View style={styles.scaledBox}>
        <Text style={styles.scaledTitle}>scaled 200 x 100</Text>
        <Text style={styles.scaledTitle}>scaled fontSize: 14</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: 'white',
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },

  box: {
    width: 200,
    height: 100,
    backgroundColor: 'yellow',
    alignItems: 'center',
    justifyContent: 'center',
  },

  scaledBox: {
    marginTop: 20,
    width: scale(200),
    height: scale(100),
    backgroundColor: 'yellow',
    alignItems: 'center',
    justifyContent: 'center',
  },

  title: {
    fontSize: 14,
  },

  scaledTitle: {
    fontSize: scale(14),
  },
});
