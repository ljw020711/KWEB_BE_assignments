const fs = require('fs');
const util = require('util');
const path = require('path');

const readDir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

const printfilename = async startdirectory => {
    try {
        const files = await readDir(startdirectory);

        for(let i = 0; i < files.length; i++)
        {
            let filepath = path.join(startdirectory, files[i]);   
            const fileinfo = await stat(filepath);

            if(fileinfo.isDirectory())
            {
                await printfilename(filepath);
            }
            else if(path.extname(filepath) == '.js')
            {
                console.log(filepath);
            }
        }

    }catch (err) {
        console.error(err);
    }
}

printfilename('./test')