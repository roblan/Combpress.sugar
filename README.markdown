# Combpress.sugar for Espresso

Combpress.sugar adds support for the [YUI Compressor](http://yui.github.io/yuicompressor/) to [Espresso](http://macrabbit.com/espresso/) and lets You combine multiple `.css` or `.js` files.

## Installation

**You must install [ShellActions.sugar](https://github.com/onecrayon/ShellActions-sugar) to use Combpress.sugar**

To install, [download Combpress.sugar](https://github.com/roblan/Combpress.sugar/archive/master), decompress the folder, and rename it `Combpress.sugar`. Then double click to install in Espresso.

Or, to install with git, run the following commands in Terminal:

    cd ~/Library/Application\ Support/Espresso/Sugars
    git clone git://github.com/roblan/Combpress.sugar.git

## Available actions

### File Actions

All **File Actions** are in **File&rarr;Actions&rarr;Combpress** menu and also in **&#9881 (Gear next to PROJECT FILES);&rarr;Combpress**

* **Combine**: combine selected documents and documents in selected folders (`.css`, `.min.css`, `.js` and `.min.js` files are combined separately). Content in combined document is separated by comments (`@group` comments in `.css` files) and saved in new file under name created by combining names of seleceted documents and proper extension.
* **Compress**: compress selected documents and documents in selected folders using [YUI Compressor](http://yui.github.io/yuicompressor/) and save generated files with extension `.min.css` or `min.js`
* **Combine &amp; Compress**: First **Combine** selected documents and documents in selected folders then **Compress** new files.

### Text Actions

All **Text Actions** are in **Action&rarr;Combpress** menu and are available (only) for `.css` and `.js` files.

* **Compress**: compress the entire document using [YUI Compressor](http://yui.github.io/yuicompressor/)

## MIT License

Copyright (c) 2013 Robert Lange

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.