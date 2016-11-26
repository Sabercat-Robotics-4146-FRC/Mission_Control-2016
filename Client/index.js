const {app, BrowserWindow, globalShortcut} = require('electron')
const path = require('path')
const url = require('url')

app.on('browser-window-created',function(e,window) {
    //window.setMenu(null);
});

let win

function createWindow () {

  win = new BrowserWindow({width: 800, height: 600})
  globalShortcut.register('CommandOrControl+Q', () => {
    win.close()
  })
  // load index.html
  win.loadURL(url.format({
    pathname: path.join(__dirname, 'index.html'),
    protocol: 'file:',
    slashes: true
  }))

  //win.webContents.openDevTools()

  win.on('closed', () => {
    win = null
  })
}

app.on('ready', createWindow)

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  if (win === null) {
    createWindow()
  }
})
