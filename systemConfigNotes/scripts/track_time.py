import time

class TrackTime:
    """
    Responsible for maintaining current time and responding
    to requests for time elapsed since timer started.
    """

    SECONDS_IN_MINUTE = 60

    def startTimer(self):
        """
        Starts timer and loops printing the current time
        elapsed second.
        """

        self.startTime = self.__getUnixTimeStamp()

        while True:
            self.__printTime()
            time.sleep(1)

    def __getTimeSince(self, startTime):
        """
        Returns an integer tuple. The first element is the number
        of minutes elapsed, the second element is the number of
        seconds elapsed.

        Parameters

        startTime: Unix time stamp of start time.
        """
        elapsedSeconds = self.__getUnixTimeStamp() - self.startTime
        minutes = elapsedSeconds/self.SECONDS_IN_MINUTE
        seconds = elapsedSeconds%self.SECONDS_IN_MINUTE

        return (minutes, seconds)

    def __printTime(self):
        elapsedTime = self.__getTimeSince(self.startTime)
        print "%02d:%02d" % (elapsedTime[0], elapsedTime[1])

    def __getUnixTimeStamp(self):
        return int(time.time())

TrackTime().startTimer()
