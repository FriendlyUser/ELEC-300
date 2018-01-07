# -*- coding: utf-8 -*-
"""
Created on Tue Dec 26 15:42:18 2017

@author: wu
"""

import re
import subprocess, os

### Create html file from latex input
latexDoc = "ReferenceDocument.tex"
outputFile = "Output.html"
templateFile = "template.html"
cssFile = "template.css"
cmd_str = ' '.join(['pandoc',
                    '-s',
                    latexDoc,
                    '--mathjax', '--toc',
                    '--highlight-style zenburn',
                    '--template', templateFile,
                    '--css', cssFile,
                    "-o",outputFile])

try:
    subprocess.check_call(cmd_str)
except subprocess.CalledProcessError:
    print('Error occured, check the command')
    pass # handle errors in the called executable
except OSError:
    print('Executable not found')
    pass # executable not found
    
## Error checking complete, run the command
print(cmd_str)
subprocess.call(cmd_str, shell=True)

base_name, extension = os.path.splitext(outputFile)
### open up tempalte file and do some editing, get syntax highlighting
finaloutput_file_name = base_name + 'Syntax' + extension
try:
    htmlFile = open(outputFile ,'r',encoding='utf-8')
    htmlSyntaxFile = open(finaloutput_file_name ,'w',encoding='utf-8')
except OSError:
    print('Cannot open files, probably because they are being used. \n')
    pass
programmingLanguage ="language-matlab"
for line in htmlFile:
    newline = re.sub('<code>', r"<code class =" + ' "' + programmingLanguage + '">', line)
    htmlSyntaxFile.write(str(newline))
    #print(newline)

htmlFile.close()
htmlSyntaxFile.close()
print('Script is Done')
    