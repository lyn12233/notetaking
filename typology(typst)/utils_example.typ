#let font_size_zh = (
  ChuHao: 42pt,
  XiaoChu: 36pt,
  YiHao: 26pt,
  XiaoYi: 24pt,
  ErHao: 22pt,
  XiaoEr: 18pt,
  SanHao: 16pt,
  XiaoSan: 15pt,
  SiHao: 14pt,
  ZhongSi: 13pt,
  XiaoSi: 12pt,
  WuHao: 10.5pt,
  XiaoWu: 9pt,
  LiuHao: 7.5pt,
  XiaoLiu: 6.5pt,
  QiHao: 5.5pt,
  XiaoQi: 5pt,
)

#let font_zh = (
  // 宋体，属于「有衬线字体」，一般可以等同于英文中的 Serif Font
  SongTi: ("Times New Roman","Songti SC"),
  // 黑体，属于「无衬线字体」，一般可以等同于英文中的 Sans Serif Font
  HeiTi: ("Arial", "SimHei"),
  // 楷体
  KaiTi: ("Times New Roman", "KaiTi", "Kaiti SC", "STKaiti", "FZKai-Z03S", "Noto Serif CJK SC"),
  // 仿宋
  FangSong: ("Times New Roman", "FangSong", "FangSong SC", "STFangSong", "FZFangSong-Z02S", "Noto Serif CJK SC"),
  // 等宽字体，用于代码块环境，一般可以等同于英文中的 Monospaced Font
  Monospaced: ("Courier New","SimHei"),
)

#let default_edge=(
  top-edge:"baseline",
  bottom-edge:"baseline",
)
#let default_text_parm=(
  font:font_zh.SongTi,
  size:font_size_zh.XiaoSi,
)+default_edge
#let default_par_parm=(
  first-line-indent:0pt,
  leading:20pt,//lineskip
  spacing:20pt,//parskip
)
#let default_list_parm=(
  first-line-indent:0pt,
  hanging-indent:6pt,
  leading:20pt,
  spacing:20pt
)
#let default_stext_parm=(
  font:font_zh.HeiTi,
  size:font_size_zh.SanHao
)+default_edge
#let default_s2text_parm=(
  font:font_zh.HeiTi,
  size:font_size_zh.SiHao
)+default_edge
#let default_s3text_parm=(
  font:font_zh.HeiTi,
  size:font_size_zh.XiaoSi
)+default_edge
#let default_spar_parm=(
  first-line-indent:0pt,
  leading:20pt,
  spacing:20pt
)

// outline numbering
#show heading.where(level: 1):set heading(numbering: "一")
#show heading.where(level: 2):set heading(numbering: "1.1")

// latex like section, subsection, subsub
//counters
#let TheSection=counter("the_section")
#let TheSubSection=counter("the_sub_section")
#let TheSubSub=counter("the_sub_sub_section")

//section
#let Section(body,inc:true,sdisp:"一、",al:center)={

  set text(..default_stext_parm)

  hide(heading(level: 1,body))

  set align(al)

  v(1.5em-20pt)

  if inc{
    TheSection.step()
    TheSubSection.update(0)
    TheSubSub.update(0)
    if(sdisp!=none){
      context TheSection.display(sdisp)
    }
  }

  context body

  parbreak()
}

#let SubSection(body,inc:true,sdisp:"1.",s2disp:"1 ")={

  set text(..default_s2text_parm)

  hide(heading(level: 2,body))

  v(1.5em-20pt)

  if inc{
    TheSubSection.step()
    TheSubSub.update(0)
    if (sdisp!=none){
      context TheSection.display(sdisp)
    }
    if (s2disp!=none){
      context TheSubSection.display(s2disp)
    }
  }
  context body
  parbreak()
  //v(-3pt)
}

#let SubSub(body,inc:true)={

  set text(..default_s3text_parm)

  hide(heading(level: 3,body))

  v(1.5em-20pt)

  if inc{
    TheSubSub.step()
    context TheSection.display("1.")
    context TheSubSection.display("1.")
    context TheSubSub.display("1 ")
  }
  context body
  parbreak()
  //v(-3pt)
}


// new paragraph for unresolved problems on chinese chars
#let Paragraph(
  body,
  ..par_parm
  )={
    set text(..default_text_parm)
    if (par_parm.named().len()==0){
      set par(..default_par_parm)
      [#h(24pt) #body]
    }else{
      set par(..par_parm)
      [#h(24pt) #body]
    }
}
#let nlist(
  indent_after:6pt,
  ..items
)={
  let nlistcounter=counter("list_counter")
  for i in items.pos(){
    nlistcounter.step()
    context Paragraph(..default_list_parm)[
      #nlistcounter.display("1.")
      #h(indent_after)
      #i
    ]
  }
  nlistcounter.update(0)
}

#let b(body)={
  [ ]
  box(raw(body), fill: luma(235), outset: 3pt)
  [ ]
}