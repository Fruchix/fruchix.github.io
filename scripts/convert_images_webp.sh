#!/usr/bin/env bash

images=()

while IFS= read -r; do
    images+=("$REPLY")
done < <(find . -name "*.png" | grep -v -E "./public.*|./node_modules.*|./resources.*")

output_format_suffix="webp"

total_before=0
total_after=0

files_to_edit=()

for image in "${images[@]}"; do
    img_prefix=${image//.png/}
    new_image="${img_prefix}.${output_format_suffix}"

    echo "$image -> ${new_image}"
    magick "$image" "${new_image}"

    before="$(du --bytes "$image" | cut -f1)"
    after="$(du --bytes "$new_image" | cut -f1)"
    echo "    $((after * 100 / before))% of original size"

    total_before=$((total_before + before))
    total_after=$((total_after + after))

    new_files_to_edit=()
    while IFS= read -r; do
        new_files_to_edit+=("$REPLY")
    done < <(grep -rnI "$(basename "$image")" --exclude-dir="public" --exclude-dir="node_modules" --exclude-dir="resources")

    for f in "${new_files_to_edit[@]}"; do
        files_to_edit+=("$f")
    done
done

echo ""
echo "Total gain: $total_before -> $total_after ($((total_after * 100 / total_before))% of original size)"
echo ""
echo "Files to edit:"
for f in "${files_to_edit[@]}"; do
    echo " - $f"
done