# -*- coding: utf-8 -*-
"""
Created on Wed Sep 13 21:09:23 2017

@author: wu
"""

import easygui
file = easygui.fileopenbox()
documentName = easygui.enterbox()
print(file)

from PyPDF2 import PdfFileWriter, PdfFileReader

inputpdf = PdfFileReader(open(file, "rb"))

for i in range(inputpdf.numPages):
    output = PdfFileWriter()
    output.addPage(inputpdf.getPage(i))
    with open("%s%s.pdf" % (documentName,i), "wb") as outputStream:
        output.write(outputStream)
        print("File: "+ "document-page%s.pdf" % i + " is printed")

print("The script is done.")