static void
upbar(const Arg *arg) {
	if( !selmon->showbar ){
		selmon->showbar = !selmon->showbar;
		updatebarpos(selmon);
		XMoveResizeWindow(dpy, selmon->barwin, selmon->wx, selmon->by, selmon->ww, bh);
		arrange(selmon);
	}
}

static void
downbar(const Arg *arg) {
	if( selmon->showbar ){
		selmon->showbar = !selmon->showbar;
		updatebarpos(selmon);
		XMoveResizeWindow(dpy, selmon->barwin, selmon->wx, selmon->by, selmon->ww, bh);
		arrange(selmon);
	}
}

