import 'package:flutter/material.dart';

class MySize {
  static Widget smallestHeight() {
    return const SizedBox(
      height: 8,
    );
  }

  static Widget smallerHeight() {
    return const SizedBox(
      height: 16,
    );
  }

  static Widget smallHeight() {
    return const SizedBox(
      height: 24,
    );
  }

  static Widget bigHeight() {
    return const SizedBox(
      height: 32,
    );
  }

  static Widget biggerHeight() {
    return const SizedBox(
      height: 36,
    );
  }

  static Widget biggestHeight() {
    return const SizedBox(
      height: 43.5,
    );
  }

  static Widget smallestWidth() {
    return const SizedBox(
      width: 8,
    );
  }

  static Widget smallerWidth() {
    return const SizedBox(
      width: 16,
    );
  }

  static Widget smallWidth() {
    return const SizedBox(
      width: 24,
    );
  }

  static Widget bigWidth() {
    return const SizedBox(
      width: 32,
    );
  }

  static Widget biggerWidth() {
    return const SizedBox(
      height: 36,
    );
  }

  static Widget biggestWidth() {
    return const SizedBox(
      width: 43.5,
    );
  }

  static Widget smallestSpace() {
    return const SizedBox(
      width: 8,
      height: 8,
    );
  }

  static Widget smallerSpace() {
    return const SizedBox(
      width: 16,
      height: 16,
    );
  }

  static Widget smallSpace() {
    return const SizedBox(
      width: 24,
      height: 24,
    );
  }

  static Widget bigSpace() {
    return const SizedBox(
      width: 32,
      height: 32,
    );
  }

  static Widget biggerSpace() {
    return const SizedBox(
      height: 36,
      width: 36,
    );
  }

  static Widget biggestSpace() {
    return const SizedBox(
      height: 43.5,
      width: 43.5,
    );
  }
}
