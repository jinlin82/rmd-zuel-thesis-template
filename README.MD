<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [rmd-zuel-thesis-template介绍](#rmd-zuel-thesis-template介绍)
- [`thesis`文件夹详细说明](#thesis文件夹详细说明)
- [thesis结构及修改说明](#thesis结构及修改说明)
- [thesis使用方法](#thesis使用方法)

<!-- markdown-toc end -->


# rmd-zuel-thesis-template介绍
该项目是一个论文模板,其主要文件结构为

```
\---rmd-zuel-thesis-template
    \---proposal
        |   beamer-header.tex
        |   Bibfile.bib
        |   rmd-template.Rmd
        |   znufelogo.jpg
        |   _bookdown.yml
        |   _output.yml
        +---codes
        +---data
        +---results
        \---style
            beamer-template.tex
            bookdown-pdf-template.tex
            chinese-gb7714-2005-numeric.csl
            default-1.17.0.2.tex
            gbt7714-plain-zuel.bst
            markdown.css
            word-styles-01.docx
            word-styles-02.docx
    \---thesis
        |   beamer-header.tex
        |   Bibfile.bib
        |   Bibfile_Pinyin.bib
        |   znufelogo.jpg
        |   _bookdown.yml
        |   _output.yml
        |   _data.Rmd
        |   znufethesis.cls
        |   index.Rmd
        |   01-intro.Rmd
        |   02-model.Rmd
        |   03-estimation.Rmd
        |   04-aqi-des.Rmd
        |   05-conclusion.Rmd
        +---codes
        +---data
        +---results
        \---style
            beamer-template.tex
            bookdown-pdf-template.tex
            chinese-gb7714-2005-numeric.csl
            default-1.17.0.2.tex
            gbt7714-plain-zuel.bst
            markdown.css
            word-styles-01.docx
            word-styles-02.docx
         \---misc    
            abstract.tex
            ack.tex
            attr.tex
            code.tex
            cover.docx
            creative.tex
            data.tex
            denotation.tex
```

1. `proposal`用来撰写**开题报告**，文件结构和使用方法与`rmd-article-template`项目相同。
2. `thesis`用来撰写**毕业论文**。
   
# `thesis`文件夹详细说明
1. `codes`是用来放置论文中用来处理模型计算的代码;
2. `data`用来放置论文写作所需的原始数据;
3. `results`用来放置论文写作过程所生成的图和表;
4. `style`部分还包括几个用来控制论文生成格式的子文件,如参考文献格式,word文档生成格式等;
5. `mics`用于修改论文内容。
6. `_bookdown.yml`是`bookdown`文档中相关字符的说明;
7. `_outout.yml`是文档转换格式`html`,`doc`,`pdf`,`bookdown`,`beamer幻灯片` 时涉及pandoc和tex的具体设置,是配置文件;
8. `bermer-header.tex`是生成幻灯片时,对作者,邮箱以及logo的设置;
9. `Bibfile.bib`文件放置了用`Jabref`整理的固定格式的参考文献文本文档，`Bibfile_Pinyin.bib`作用后续作补充介绍;
10. `znufelogo.jpg`即生成幻灯片时的Logo。
11. `znufethesis.cls`是用来控制论文模板的核心格式，不要动
12. `_data.Rmd`用于设置论文中原始数据部分，`index.Rmd`用于设置论文格式，这两个文件**名称不能改变**
13. `01-intro.Rmd`、`02-model.Rmd`、`04-aqi-des.Rmd`、`05-conclusion.Rmd`用于撰写正文内容，`01-`、`02-`等序号不能变动，后面的英文可以更改，自己命名。也就是说正文rmd文档名称必须以序号开头。
14. `_book`存放生成的论文pdf等文件。

# thesis结构及修改说明
1. **封面**：包括中英文封面。通过`misc`文件夹中的`cover.docx`来修改论文封面。若有`cover.pdf`，**首先把`cover.pdf`删除！**，然后修改`cover.docx`里的内容，**文档名称cover.docx不能更改**。
   **注**：只有将`cover.pdf`删除后，修改的`cover.docx`内容才能生效。
2. **声明** :自动生成，不用修改。
3. **缩写列表**:文中英文缩写解释说明。通过`misc`文件夹中`denotation.tex`中修改
4. **摘要**:包括中英文摘要，通过`misc`文件夹中`abstract.tex`中修改
5. **目录**:自动生成，不用自己写
6. **正文**:在`01`、`02`等rmd中编辑和修改
7. **参考文献**:通过编辑`Bibfile.bib`文件后自动生成,不用自己写
8. **程序代码**:展示重要程序代码。在生成pdf时，只要rmd中有的R和python代码，都会被自动提取出来放入`codes`文件夹中。需要在论文中展示的代码，在`misc`文件夹中`code.tex`中修改。R,python代码修改方式不同。
   - 展示python代码:复制下面的语句，将下面的`02-model`改为需要展示的python代码所在的章节rmd名称，如`03-estimation`
   ```
   \lstinputlisting[caption= Python 程序代码, language=Python]{./codes/02-model.py}
   \lstinputlisting[caption= Python 程序代码, language=Python]{./codes/03-estimation.py}
   ```
   - 展示R代码：复制下面的语句，将下面的`03-estimation`改为需要展示的R代码所在的章节rmd名称，如`04-aqi-des`
   ```
   \lstinputlisting{./codes/03-estimation.R}
   \lstinputlisting{./codes/04-aqi-des.R}
   ```

9.  **原始数据**:在`_data.Rmd`修改,按照rmarkdown插入表格的格式修改，原始数据要存
    放在`data`文件夹中。`\misc\data.tex` 是自动生成的，所以不要push到库中
10. **致谢**:在`misc`文件夹中`ack.tex`中修改。



# thesis使用方法
 1. 克隆项目`rmd-zuel-thesis-template`到电脑文件夹中
 2. 将该项目作为模板存放，新建一个文件夹如`s-thesis`,将`rmd-zuel-thesis-template`中的两个子文件夹`proposal`、`thesis`复制到`s-thesis`文件夹中。
 3. `bookdown-pdf.bat`、`bookdown-pdf.R`用于输出pdf,在子文件夹`thesis`文件夹中双击`bookdown-pdf.bat`运行可生成pdf；或者用vscode打开自己建的文件夹如`s-thesis`,任意点击一个编辑的正文rmd文件如`01-intro.Rmd`,按下快捷键`ctrl+p`,在弹出的窗口中输入`task `(task后加一个空格),选择`bookdown-pdf`，生成论文pdf文件。
 4. 运行后会自动生成`-book`文件夹，存放pdf等文件。
 5. **论文标题**： 在 `cover.docx`, `index.rmd`和最后一个 rmd 文件中的title（页
    眉标题由此控制） 属性应一致为论文标题

    **注**：生成pdf有以下先决条件：
    - 借助于R,R程序环境变量(`C:\Worktools\R\R-3.5.1\bin\x64`)要设置成功
    - `officetopdf.exe`放在bat文件夹中，worktools的bat文件在环境变量里(`C:\Worktools\bat`)
    - office中`word软件`发挥作用

