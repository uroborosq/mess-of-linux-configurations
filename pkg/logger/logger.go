package logger

import (
	"os"

	"github.com/juju/loggo"
)

var logger = loggo.GetLogger(loggo.DefaultWriterName)

func Info(s string, args ...any) {
	logger.Infof(s, args...)
}

func Warn(s string, args ...any) {
	logger.Warningf(s, args...)
}

func Fatal(s string, args ...any) {
	logger.Errorf(s, args...)
	os.Exit(1)
}

func Error(s string, args ...any) {
	logger.Errorf(s, args...)
}
