echo "create Makefile ..."
if [ "1" ] ; then 
echo 'all:'
echo '	g++ -lncurses mouse.cpp -o mouse'
fi > Makefile

echo "create mouse.cpp ..."
if [ "1" ] ; then 
echo '#include <ncurses.h>'
echo '#include <string.h>'
echo ''
echo '#define WIDTH 30'
echo '#define HEIGHT 10'
echo ''
echo 'int startx = 0;'
echo 'int starty = 0;'
echo ''
echo 'const char * choices[] = { "Choice 1",'
echo '	"Choice 2",'
echo '	"Choice 3",'
echo '	"Choice 4",'
echo '	"Exit",'
echo '};'
echo ''
echo 'int n_choices = sizeof(choices) / sizeof (char *);'
echo ''
echo 'void print_menu(WINDOW *menu_win, int hightlight);'
echo 'void report_choice(int mouse_x, int mouse_y, int *p_choice);'
echo ''
echo 'int main()'
echo '{'
echo '	int c, choice = 0;'
echo '	WINDOW * menu_win;'
echo '	MEVENT event;'
echo '	'
echo '	/* Initialize curses */'
echo '	initscr();'
echo '	clear();'
echo '	noecho();'
echo '	cbreak();             //Line buffering disabled. pass on everything'
echo ''
echo '	/* Try to put the window in the middle of screen */'
echo '	startx = (80 - WIDTH) / 2;'
echo '	starty = (24 - HEIGHT) / 2;'
echo ''
echo '	attron(A_REVERSE);'
echo '	mvprintw(23, 1, "Click on Exit to quit (Works best in a virtual console)");'
echo '	refresh();'
echo '	attroff(A_REVERSE);'
echo ''
echo '	/* Print the menu for the first time */'
echo '	menu_win = newwin(HEIGHT, WIDTH, starty, startx);'
echo '	print_menu(menu_win, 1);'
echo '	/* Get all the mouse events */'
echo '	mousemask(ALL_MOUSE_EVENTS, NULL);'
echo ''
echo '	while(1)'
echo '	{'
echo '		c = wgetch(menu_win);'
echo '		switch(c)'
echo '		{'
echo '			case KEY_MOUSE:'
echo '				if(getmouse(&event) == OK)'
echo '				{'
echo '					/* When the user clicks left mouse button */'
echo '					if(event.bstate & BUTTON1_PRESSED)'
echo '					{'
echo '						report_choice(event.x + 1, event.y + 1, &choice);'
echo '						if(choice == -1) // Exit chosen'
echo '							goto end;'
echo '						mvprintw(22, 1, "Choice made is : %d String Chosen is ", choice);'
echo '						refresh();'
echo '					}'
echo '				}'
echo '				print_menu(menu_win, choice);'
echo '				break;'
echo '		}'
echo '	}'
echo 'end:'
echo '	endwin();'
echo '	return 0;'
echo '}'
echo ''
echo 'void print_menu(WINDOW *menu_win, int highlight) '
echo '{'
echo '	int x, y, i;'
echo '	x = 2; y = 2; box(menu_win, 0, 0);'
echo '	for(i =	0; i < n_choices; ++i)'
echo '	{'
echo '		if(highlight == i + 1)'
echo '		{'
echo '			wattron(menu_win, A_REVERSE); '
echo '			mvwprintw(menu_win, y, x, "%s", choices[i]); '
echo '			wattroff(menu_win, A_REVERSE);'
echo '		}'
echo '		else'
echo '			mvwprintw(menu_win, y, x, "%s", choices[i]);'
echo '		++y;'
echo '		wrefresh(menu_win);'
echo '	}'
echo '}'
echo ''
echo ''
echo 'void report_choice(int mouse_x, int mouse_y, int *p_choice)'
echo '{'
echo '	int i,j, choice;'
echo ''
echo '	i = startx + 2; j = starty + 3;'
echo ''
echo '	for(choice = 0; choice < n_choices; ++choice) '
echo '		if(mouse_y == j + choice && mouse_x >= i && mouse_x <= i + strlen(choices[choice]))'
echo '		{'
echo '			if(choice == n_choices - 1) *p_choice = -1;'
echo '			else '
echo '				*p_choice = choice + 1;'
echo '			break;'
echo '		}'
echo '}'
fi > mouse.cpp
make
