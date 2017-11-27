URL="http://dict.youdao.com/fsearch"
PARAMS="&keyfrom=mac.main&client=macdict&le=eng"
PHONETIC_TAG_REGEX="<[/]*phonetic-symbol>"
PHONETIC_REGEX="$PHONETIC_TAG_REGEX.*$PHONETIC_TAG_REGEX"
CONTENT_TAG_REGEX="<[/]*content>"
CONTENT_REGEX="$CONTENT_TAG_REGEX.*$CONTENT_TAG_REGEX"
TRANS_REGEX="<[/]*trans>.*<[/]*trans>"
PLACEHOLDER="无搜索结果"
QUERY=$1

response=$(curl -Gd "q=$QUERY$PARAMS" $URL)
phonetic=$(echo `echo "$response" | grep $PHONETIC_REGEX` | sed "s/${PHONETIC_TAG_REGEX}//g")
content=$(echo `echo "$response" | grep $CONTENT_REGEX` | sed -e 's/<translation><content><\!\[CDATA\[//g' -e 's/\]\]><\/content><\/translation>//g')
webTrans=$(echo `echo "$response" | grep $TRANS_REGEX` | sed -e 's/<trans><value><\!\[CDATA\[//g' -e 's/\]\]><\/value><\/trans>/;/g')

if [ -z "$phonetic" ]; then
  phonetic="没提供音标"
fi

if [ -z "$content" ]; then
  content=$PLACEHOLDER
fi

if [ -z "$webTrans" ]; then
  webTrans=$PLACEHOLDER
fi

cat << EOB
{
  "items": [
  {
    "title": "音标",
    "subtitle": "$phonetic",
  },
  {
    "title": "释义",
    "subtitle": "$content"
  },
  {
    "title": "网路释义",
    "subtitle": "$webTrans"
  }
  ]
}
EOB
