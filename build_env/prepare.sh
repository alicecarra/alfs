# export DIST_ROOT=/home/alice/projects/alfs 
# export LFS=$DIST_ROOT/build_env/build_root

echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"

mkdir -p $LFS/sources

for file in $(cat $DIST_ROOT/build_env/build_env_list) 
do
    base_name=$(basename $file)
    if ! test -f $LFS/sources/$base_name ; then
        wget $file -O $LFS/sources/$base_name
    fi
done;

echo "All downloaded"