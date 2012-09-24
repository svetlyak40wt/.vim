nnoremap <buffer> <Leader><Leader> :!git log $(git log --grep=Version \| head -1 \| cut -f 2 -d ' ')..HEAD --format='\%s' \| grep -v -e Merge -e Finished<CR>
