#!/bin/sh

getDefaultSink() {
    defaultSink=$(pactl info | awk -F : '/Default Sink:/{print $2}')
    description=$(pactl list sinks | sed -n "/${defaultSink}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

getDefaultSource() {
    defaultSource=$(pactl info | awk -F : '/Default Source:/{print $2}')
    description=$(pactl list sources | sed -n "/${defaultSource}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

VOLUME=$(pamixer --get-volume-human)
SINK=$(getDefaultSink)
SOURCE=$(getDefaultSource)

case $1 in
    "--up")
        pamixer --increase 2
        ;;
    "--down")
        pamixer --decrease 2
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
        echo "Source: ${SOURCE} | Sink: ${VOLUME} ${SINK}"
esac
