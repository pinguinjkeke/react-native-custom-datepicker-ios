/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
} from 'react-native';
import CustomDatePickerIOS from 'react-native-custom-datepicker-ios';

colors = ['red', '#000', 'pink', '#9b9b4f'];

export default class App extends Component<{}> {
  state = {
    colorIndex: 0,
    currentDate: new Date()
  };

  handleDateChange = (date) => {
    this.setState({ currentDate: date });
  }

  componentWillMount() {
    this.interval = setInterval(() => {
      const colorIndex = this.state.colorIndex === colors.length - 1
        ? 0
        : this.state.colorIndex + 1;

      this.setState({ colorIndex });
    }, 3000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>{this.state.currentDate.toString()}</Text>
        <CustomDatePickerIOS
          date={this.state.currentDate}
          onDateChange={this.handleDateChange}
          style={{ width: '100%' }}
          textColor={colors[this.state.colorIndex]}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
