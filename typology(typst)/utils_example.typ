// common typst utils
// 
// usage: 
// 
//   #import "/path/to/this/file/utils.h":*
// 
//   #set text(..default_text_parm)
//   #set par(..default_par_parm)
//   #set pagebreak(weak:true)
//   
//   #set image(height: 5cm, width: 6.67cm)
//   #show figure.where(kind: image):set figure(..default_FOI_parm)
//   #show figure.where(kind: table):set figure(..default_FOT_parm)
//   #show figure.caption:set text(size:font_size_zh.WuHao)
//   #show figure.where(kind: table): set figure.caption(position:top)
//   
//   #show heading.where(level: 1):set heading(numbering: "1")
//   #show heading.where(level: 2):set heading(numbering: "1.1")
// 
// for "1-1" naming issue, see github.com/typst issues 606 and 1896(adopted one)

// headings wrapped into latex-like section for better spacing

//font adopted from zhihu
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


//counters
//#let TheImage=counter("the_image")
//#let TheTable=counter("the_figure")
#let TheSection=counter("the_section")
#let TheSubSection=counter("the_sub_section")
#let TheSubSub=counter("the_sub_sub_section")


// default text and parargraph parameters
#let default_edge=(//adhere to the definition of \lineskip
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
  justify:true
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


// figure numbering
#let figure_inf=(0,)

#let default_figure_parm=(
  gap:10pt,//from caption to image/table
  supplement:""
)
//#show figure.caption: it => [
//  #underline(it.body) |
//  #it.supplement
//  #context it.counter.display(it.numbering)
//]

#let default_FOI_parm=(//figure of image
  numbering:it=>{
    //TheImage.step()
    [图 #TheSection.display("1")-#counter(figure.where(kind:image)).display("1")]
  },
)+default_figure_parm
#let default_FOT_parm=(//figure of table
  numbering:it=>{
    //TheTable.step()
    [表 #TheSection.display("1")-#counter(figure.where(kind:table)).display("1")]
  }
)+default_figure_parm


// latex like section, subsection, subsub

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
    counter(figure.where(kind:image)).update(0)
    //TheImage.update(0)
    //TheTable.update(0)
    if(sdisp!=none){
      context TheSection.display(sdisp)
    }
  }

  context body

  parbreak()
}
//subsection
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
//subsubsection
#let SubSub(
  body,
  inc:true,
  sdisp:"1.",
  s2disp:"1.",
  s3disp:"1 ")={

  set text(..default_s3text_parm)

  hide(heading(level: 3,body))

  v(1.5em-20pt)

  if inc{
    TheSubSub.step()
    if (sdisp!=none){
      context TheSection.display(sdisp)
    }
    if (s2disp!=none) {
      context TheSubSection.display(s2disp)
    }
    if (s3disp!=none) {
      context TheSubSub.display(s3disp)
    }
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
  [
    #set text(top-edge: "bounds",
    bottom-edge: "bounds")
    #box(raw(body), fill: luma(235), outset: 3pt)
  ]
  [ ]
}


// additional tips setting in the main page
// 
//  //set equation props
//  #set math.equation(numbering: "(1)", supplement: "")
// 
//  #show figure.where(kind:image): set figure(supplement: "图") //deprecated
//  #show figure.where(kind:table): set figure(supplement: "表") //deprecated
//
//  //page style
//  #set page(
//    footer: [
//      #set align(center)
//      #context counter(page).display("1")
//    ]
//  )
//
//  // bib upercase style; disable auto-generated footnote
//  #set footnote(numbering: "[1]")
//  #set footnote.entry(separator: none)
//  #show footnote.entry: hide
// 
//  // outline numbering
//  #show heading.where(level: 1):set heading(numbering: "一")
//  #show heading.where(level: 2):set heading(numbering: "1.1")