/* See LICENSE file for copyright and license details. */
#include "push.c"
#include "upbar.c"
#include <X11/XF86keysym.h>

/* appearance */
static const char font[]            = "-*-terminus-medium-r-*-*-20-*-*-*-*-*-iso10646-*";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#555555";
static const char selbgcolor[]      = "#555555";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = False;     /* False means bottom bar */

/* tagging */
#define MAX_TAGLEN 16
static const char *tags[] = { "Main", "sub-1", "sub-2" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            True,        -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       False,       -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define MODSHIFT Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *browsercmd[]={ "google-chrome",NULL}; 

static const char *raisevolume[]={"amixer","set","Master","10%+",NULL};
static const char *lowervolume[]={"amixer","set","Master","10%-",NULL};

static const char *lowerBrightness[]={"xbacklight","-10",NULL};
static const char *raiseBrightness[]={"xbacklight","+10",NULL};

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,		   XF86XK_AudioLowerVolume,      spawn,          {.v = lowervolume } },
	{ 0,		   XF86XK_AudioRaiseVolume,      spawn,          {.v = raisevolume } },

	{ 0,		   XF86XK_MonBrightnessUp,       spawn,          {.v = raiseBrightness } },
	{ 0,		   XF86XK_MonBrightnessDown,     spawn,          {.v = lowerBrightness } },

	{ MODKEY|ControlMask,           XK_Up,     pushup,         {0} },
	{ MODKEY|ControlMask,           XK_Down,   pushdown,       {0} },
	{ MODKEY,                       XK_Menu,   spawn,          {.v = dmenucmd } },
	{ MODKEY|MODSHIFT,              XK_t,      spawn,          {.v = termcmd } },
	{ MODKEY|MODSHIFT,              XK_c,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_v,      togglebar,      {0} },
	{ MODKEY,                       XK_u,      upbar,          {0} },
	{ MODKEY,                       XK_d,      downbar,        {0} },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = -1 } },
	{ MODKEY|MODSHIFT,              XK_Up,     incnmaster,     {.i = +1 } },
	{ MODKEY|MODSHIFT,              XK_Down,   incnmaster,     {.i = -1 } },
	{ MODKEY|MODSHIFT,              XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY|MODSHIFT,              XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,			            XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|MODSHIFT,              XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|MODSHIFT,              XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|MODSHIFT,              XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|MODSHIFT,              XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|MODSHIFT,              XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

