# simple ipython_config.py
c = get_config()

c.TerminalIPythonApp.display_banner = False
c.TerminalIPythonApp.classic = True
c.InteractiveShellApp.log_level = 30
c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = 'LightBG'
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.deep_reload = True
c.InteractiveShell.editor = 'vim'
c.InteractiveShell.xmode = 'Context'

c.PromptManager.in_template  = '[\#] >>> '
c.PromptManager.in2_template = '   .\D.: '
c.PromptManager.out_template = '[\#] Out: '
c.PromptManager.justify = True

# c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
 ('la', 'ls -al')
]
