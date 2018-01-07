# -*- coding: utf-8 -*-
"""
Created on Sun Dec 31 09:50:49 2017

@author: David Li
Helper script to create lwarpnotes, latex file should be set to \nonstopmode
"""

import subprocess,os
# consider using command line arguments to prompt the user for input if being run from command line or hardcoded value if any arguements are passed through.
#if len(sys.argv) > 1:
    #input_tex_file = 'ELEC300Notes.tex'
#else:
    #input_tex_file = input("Enter the tex name. ")
input_tex_file = 'ELEC300Notes.tex'
base_name, extension = os.path.splitext(input_tex_file)
if os.path.isfile(input_tex_file):
    print('Proceeding to produce: ' + base_name + '.pdf and ' + base_name +'_html' +  extension + '\n' )
else:
    print('Check the file name again \n')
    
cmd_str1 = ' '.join(['pdflatex',
                    input_tex_file])

try:
    subprocess.check_call(cmd_str1)
    print('Calling: ' + cmd_str1)
except subprocess.CalledProcessError:
    print('Error occured, check the command')
    pass # handle errors in the called executable
except OSError:
    print('Executable not found')
    pass # executable not found

lwarpHTMLFile = base_name +'_html' +  extension
# Try using latexmk to create html files
latexmk_cmd = ' '.join(['latexmk',
                       '-pdf',
                       '-bibtex',
                       '-time',
                    lwarpHTMLFile])
try:
    subprocess.check_call(latexmk_cmd)
    print('Calling: %s' % latexmk_cmd)
except subprocess.CalledProcessError:
    print('Error occured, check the command')
    pass # handle errors in the called executable
except OSError:
    print('Executable not found')
    pass # executable not found

cmd_str3 = ' '.join(['lwarpmk',
                    'pdftohtml'])
try:
    subprocess.check_call(cmd_str3)
    print('Calling: ' + cmd_str3)
except subprocess.CalledProcessError:
    print('Error occured, check the command')
    pass # handle errors in the called executable
except OSError:
    print('Executable not found')
    pass # executable not found
print('Script is done producing the documents')

print('Now it will use prism.js and prism.css to highlight listings')

### Dump files into finalNotes directory
### Outputting results to latex file and then using pandoc

####################################################################################
####### Assuming that the user is already in the folder contain the tex files #######
# Change directory to where this script is
#os.chdir(os.path.dirname(sys.argv[0]))
#timestr = time.strftime("%Y%m%d-%H%M%S")
###################################################################################

directory = 'finalNotes'
if not os.path.exists(directory):
    os.makedirs(directory)
    # go to that new directory
    os.chdir(directory)
# Find the </title> end tag and add in my prism.css and prism.js
### open up template file and do some editing, get syntax highlighting
# Assume their are not other html files in my directory and if they do, they shouldn't have  the lwarp <pre class="programlisting" >
lwarpFiles = []
dir_list =  os.listdir()
for full_file_name in dir_list:
    base_nameTemp, extensionTemp = os.path.splitext(full_file_name)
    if extensionTemp == '.html': # then .pdf file --> convert to image!
        lwarpFiles.append(full_file_name)

import re
for outputFile in lwarpFiles:      
    try:
        base_nameTemp, extensionTemp = os.path.splitext(outputFile)
        finalOutputName = base_nameTemp + extensionTemp
        htmlFile = open(outputFile ,'r',encoding='utf-8')
        htmlSyntaxFile = open(directory + r'/' +finalOutputName  ,'w',encoding='utf-8')
    except OSError:
        print('Cannot open files, probably because they are being used. \n')
        pass
    # include prismCss and prismjs in the final html final, consider merging the existing css file with prism.css
    prismCss = r'<link rel="stylesheet" href="prism.css" type="text/css">'
    prismJs  = r'<script src="prism.js" type="text/javascript"> </script>'
    
    # Replace the lwarp <pre class="programlisting" >
    # with something that works for prism
    lwarpCodeSyn = r'<pre class="programlisting" >' 
    lwarpCodeVerb = r'<pre class="verbatim" >'
    programmingLanguage ="language-matlab"
    verbatimPL = "language-latex"
    prismVerbCodeSyn = r'<pre><code class = "' + verbatimPL + r'">'
    prismCodeSyn = r'<pre><code class = "' + programmingLanguage + r'">'
    
    for line in htmlFile:
        # Include prism.js and prism.css after the title in the html document 
        newline = re.sub(r'</title>',r'</title>' + '\n' + prismCss + '\n' + prismJs, line)
        ## get code syntax highlighting
        newline = re.sub(lwarpCodeSyn, prismCodeSyn, newline)
        ## since a new code tag is introduced it must be closed
        newline = re.sub(r'</pre>',r'</code>' + '\n' + r'</pre>' + '\n', newline)
        # account for new problem of <pre class="verbatim" > 
        newline = re.sub( lwarpCodeVerb,  prismVerbCodeSyn, newline)
        htmlSyntaxFile.write(str(newline))
        #print(newline)
    
    htmlFile.close()
    htmlSyntaxFile.close()

lwarpmk_clean = ' '.join(['lwarpmk',
                    'clean',
                    base_name])
latexmk_clean = ' '.join(['latexmk',
                          '-C'
                        ])
try:
    subprocess.check_call(latexmk_clean)
    print('Calling: %s' % latexmk_clean)
    subprocess.check_call(lwarpmk_clean)
    print('Calling: %s' % lwarpmk_clean)
except subprocess.CalledProcessError:
    print('Error occured, check the command')
    pass # handle errors in the called executable
except OSError:
    print('Executable not found')
    pass # executable not found
print('Script is Done')
