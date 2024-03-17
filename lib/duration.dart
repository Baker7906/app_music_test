String secondsToMinutes(int seconds) {
  final int minutes = (seconds / 60).floor();
  final int remainingSeconds = seconds - (minutes * 60);

  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
}
