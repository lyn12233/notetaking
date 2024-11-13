# online docs

[latexstudio](https://www.latexstudio.net/)

[overleaf](https://www.overleaf.com)

# features

## supplementary files (.cls .sty)

[.cls and .sty files, loaded with documentclass and usepackage respectively](https://tug.org/pracjourn/2005-3/asknelly/nelly-sty-&-cls.pdf#:~:text=In%20general%2C.cls%20and.sty%20files%20are%20supplementary%20files%20that,and.sty%20files%20%E2%80%98style%20files%E2%80%99%2C%20or%20often%20just%20%E2%80%98packages%E2%80%99.)

[component of .cls](https://blog.csdn.net/tsingke/article/details/105960941)
and [.sty](https://www.latexstudio.net/archives/51776.html)

overleaf tutorial: [Writing_your_own_class](https://www.overleaf.com/learn/latex/Writing_your_own_class)

where:
    - \\NeedsTeXFormat{LaTeX2e}: always
    - \\ProvidesClass{< class_name >} [ YYYY/MM/DD ]: class name should be file name
    - \\LoadClass{article}: inheritance

## defining command

define format: `\(re)newcommand{\< name >}[ < nb_args > ]{ < text_group > }`

## operator@

to name private command

## chinese

packages/classes:
    - ctex.sty
    - ctexart.cls

setting default font: `\renewcommand{\CJKfamilydefault}{\CJKrmdefault}`(rm: roman)

chinese headings: 

```\ctexset{section={[format=...,][name={[...],[...]},][number=[\chinese{section}],][beforeskip][afterskip][aftername]}}```

    - format: font style
    - name: befor and after counter
    - number: counter display
    - ...

[see also](https://texdoc.org/serve/ctex.pdf/0)

[see also](https://zhuanlan.zhihu.com/p/464244924)

[see also](https://blog.csdn.net/qq_44643644/article/details/107358084)

# trouble shooting

1. `Missing = inserted for \ifnum. \usepackage`

    string format YYYY/MM/DD is strict matching. check it or delete it

    [see also](https://tex.stackexchange.com/questions/274650/missing-inserted-for-ifnum)

2. `command .. already defined`

    use `grep -r -n '\\newcommand(\*)\\<name>' `

    [see also](https://tex.stackexchange.com/questions/435052/command-already-defined-but-where)

    example: ctex.sty conflict with article.cls in my class. need to load `article` first


