TARGET=$2/zst
echo "compress file list"
find $2 -name '*.db3'
echo "compressed file is in "$TARGET
echo ""
echo ""

find $2 -name '*.db3' | xargs -n1 pzstd -19 -p $1
mkdir -p $TARGET
find $2 -name '*.zst' | xargs -I% mv % $TARGET

