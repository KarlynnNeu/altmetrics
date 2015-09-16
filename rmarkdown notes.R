#notes on markdown
#make a text file and save as .md
#type in your info, then put an empty line to start a new paragraph
#add two spaces after somethin to start a new line
#double astrict before and after a word makes it bold
#underscore before and after makes italics 
#to make things in grey code use a tick before and after (under the tilda)
#three back ticks makes a code block
#install hyperlinks: 
#inline: [Priem et al. 2012.](http://arxiv.org/abs/1203.4745)


#notes on Rmarkdown
#when you open an rmarkdown you can chose any format
#the {r} allows for display of the input and the output of your funcitons
#control option i will insert the ```{r}``` for you to start a new section
#you can name the sections by adding into the {r NAME}
#{r, echo=FALSE} will evaluate code but not show it, useful for large complicated code blocks you dont want to share
#set self_contained = false will generate a folder with each separate part of the html doc
#so you can isolate single sections of the document to share with people
#such as just sending a single figure from a large document.
#you can still write these reports in R instead of Rstudio (such as on cluster)
#make a text edit save as Rmd and then render to view with these lines
library("rmarkdown")
render("altmetrics_analyses.Rmd")
#will save the file in the output folder, because no output window in cluster
render("filename.Rmd", word_document())
#to make the document as a word

_______
#now using dplyr in rMarkdown
#power in that you can combine filters into one line 