@echo off

cd %cd%

set ppx2="%cd%\ppx2.exe"
set cut="%cd%\cut.exe"
set cat="%cd%\cat.exe"
set grep="%cd%\grep.exe"
set wget="%cd%\wget.exe"
set zip="%cd%\7z.exe"

set parallel-count=8

If %1 equ 1 (
	set mangatitle="[NEW]Bleach"
	set main-link=http://kasumiremix.appspot.com/mangareader.net/bleach
) else If %1 equ 2 (
	set mangatitle="[NEW]FairyTail"
	set main-link=http://kasumiremix.appspot.com/mangareader.net/fairy-tail
) else If %1 equ 3 (
	set mangatitle="[NEW]NarutoGaidenTheSeventhHokage"
	set main-link=http://kasumiremix.appspot.com/mangareader.net/naruto-gaiden-the-seventh-hokage
) else If %1 equ 4 (
	set mangatitle="[NEW]OnePiece"
	set main-link=http://kasumiremix.appspot.com/mangareader.net/one-piece
) else If %1 equ 5 (
	set mangatitle="[NEW]ShingekiNoKyojin"
	set main-link=http://kasumiremix.appspot.com/mangareader.net/shingeki-no-kyojin
) else If %1 equ 6 (
	set mangatitle="[NEW]ShingekiNoKyojinBeforeTheFall"
	set main-link=http://kasumiremix.appspot.com/mangareader.net/attack-on-titan-before-the-fall
) else (goto directexit)

set /a c=%2 && goto download

:download
	set tmp="%mangatitle%-%c%"
	mkdir %tmp% && cd %tmp%
	%wget% -nv -O 1.html %main-link%/%c%
	%grep% -c "option value" *.html >> page.tmp
	for /f %%a in (page.tmp) do set page=%%a && del page.tmp
	for /l %%a in (2,1,%page%) do echo %main-link%/%c%/%%a>>view-pages.tmp
	%cat% view-pages.tmp | %ppx2% -P %parallel-count% -I {} %wget% -nv -c -E {} && del view-pages.tmp
	%grep% -h name^=\"img\" *.html >> links.tmp && del *.html
	%grep% -o src=".*.jpg" links.tmp >> links.ttmp && del links.tmp
	%cut% >> links.tmp -f2 -d\" links.ttmp
	for /f %%a in (links.tmp) do echo http://kasumiremix.appspot.com%%a >> links.txt
	for %%a in (ttmp tmp) do del *.%%a
	%cat% links.txt | %ppx2% -P %parallel-count% -I {} %wget% -nv -t 0 -T 4 {} && del links.txt
	%zip% a -tzip -mx=9 ..\%tmp%.zip *.* && cd .. && rd /s /q %tmp%
	exit

:directexit
echo an error occured
pause
