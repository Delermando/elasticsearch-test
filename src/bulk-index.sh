#!/usr/bin/python

rm -f /tmp/events.json

echo -n "Indexing $l ..."

while read LINE; do
	echo '{"index":"wordismic","_type":"event"}}' >> /tmp/events.json
	echo $LINE >> /tmp/events.json
done < "$i"

curl -s -X POST --data-binary @/tmp/events.json 'locahost:9200' > /dev/null

rm /tmp/events.json
echo " done."

# terminal command
# for JSON in events-2016/*.json; do ./bulk-index.sh $JSON; done
