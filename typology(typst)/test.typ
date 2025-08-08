#import  "utils_example.typ": *

  #set text(..default_text_parm)
  #set par(..default_par_parm)
  #set table(stroke:none)
  #set pagebreak(weak:true)
  
  #set image(..default_image_parm)
  #set grid(..default_grid_parm)
  #show bibliography: set grid(..default_bib_grid_parm)

  #show figure.where(kind: image):set figure(..default_FOI_parm)
  #show figure.where(kind: table):set figure(..default_FOT_parm)
  #show figure.caption:set text(size:font_size_zh.WuHao)
  #show figure.where(kind: table): set figure.caption(position:top)
  
  #show heading.where(level: 1):set heading(numbering: "1")
  #show heading.where(level: 2):set heading(numbering: "1.1")

  #show math.equation:set text(font: ("New Computer Modern Math","SimSun"))

// outline
#[
  #set text(font: font_zh.HeiTi)
  #set align(center)
  目录
  #outline(depth: 2, indent: 1em, title: none)
  #pagebreak()
]

//page footer
#set page(
  footer: [
    #set align(center)
    #context counter(page).display("1")
  ]
)
#counter(page).update(1)

//footnote
#set footnote(numbering: "[1]")
#set footnote.entry(separator: none)
#show footnote.entry: hide

#Section("Section1 第一章")

青山横北郭, 白水绕东城。
此地一为别，孤蓬万里征。浮云游子意，落日故人情。
挥手自兹去，
萧萧班马鸣。
#lorem(50)

#SubSection("subSection1 测试")

青山横北郭, 白水绕东城。
此地一为别，孤蓬万里征。浮云游子意，落日故人情。
挥手自兹去，
萧萧 @bib_1 班 @bib_2 马鸣。
#lorem(50)

#SubSub("SubSub1 测试")

青山横北郭a, 白水绕东城b。
此地一b为别，孤蓬d万里征。浮云游e子意，落日故人f情。
挥手gh自ijklmn兹去，
萧rst萧班马鸣。
#lorem(50)

#SubSub("SubSub1 测试")

#lorem(50)

#SubSub("哈基米叮咚鸡")
哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一

#SubSub("SubSub1 测试")

#lorem(50)

#Section("哈牛魔")
#Section("哈牛魔")
#Section("哈牛魔")
#SubSection("哈牛魔")
#Section("哈牛魔")
#SubSection("哈牛魔")
#Section("哈牛魔")
#SubSection("哈牛魔")
#SubSection("哈牛魔")
#SubSection("哈牛魔")
#SubSub("哈牛魔")
#SubSection("哈牛魔")
#SubSub("哈牛魔")
#SubSection("哈牛魔")
#SubSub("哈牛魔")
#SubSub("哈牛魔")
#SubSub("哈牛魔")

#Section("哈牛魔")
哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段
#Section("哈牛魔")
哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段
#SubSection("哈牛魔")
哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段
#SubSection("哈牛魔")
哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段哈基米叮咚鸡胖宝宝踩踩背搞核酸袋鼠鸡一代一段 @bib_3 @bib_4 @bib_5

#[
  #set align(center)
  #figure(
    grid(
      [
        #figure(
          image("test1.jpg"),
          caption: "dingdongji叮咚鸡"
        )<img1>
      ],[
        #figure(
          image("test2.jpg"),
          caption: "滚木"
        )<img2>
      ]
    ),
    caption: "compound"
  )<compound1>
]

Figure @compound1 shows a compound figure consisting of two images arranged in a grid. 
如 @img1 和 @img2 所示。

$ 
  T_1 = mat(
    cosh(eta), sinh(eta), 0, 0;
    sinh(eta), cosh(eta), 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1;
  ) quad "洛伦兹变换"
 $

#pagebreak()
#Section("References")
#[
  // #show text: set align(left)
  #set align(left)
  #bibliography("bib.bib", title: none, style: "gb-7714-2015-note")
]
