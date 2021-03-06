view     = null
scene    = null
skeleton = null
sync     = null

setup = ->
  setupPaper()
  setupSkeleton()

  setMetamorphose 'tiroirs'

  window.addEventListener('resize', windowResized)
  window.addEventListener('keydown', onKeyDown)
  window.addEventListener('touchstart', onTouchStart)

  windowResized()

setupPaper = ->
  canvas = document.createElement('canvas')
  canvas.setAttribute 'data-paper-hidpi', ''
  canvas.setAttribute 'data-paper-resize', ''
  document.body.appendChild canvas

  paper.setup canvas
  paper.view.onFrame = onFrame

  view = new paper.Layer()
  view.transformContent = false
  
setupSkeleton = ->
  skeleton = new mk.skeleton.Skeleton window.debug
  skeleton.dataRatio = 640 / 480
  view.addChild(skeleton.view)

  sync = new mk.skeleton.SkeletonSync skeleton, 'http://kikko.local:8080'
  # sync = new SkeletonSync skeleton, 'http://192.158.28.53:80'
  sync.onUserIn = onUserIn
  sync.onUserOut = onUserOut
  sync.onRatio = onRatio
  sync.onDataUpdated = onDataUpdated
  sync.connect()

# Global Setters

setMetamorphose = (m11) ->
  window.metamorphose = m11
  if scene
    scene.setMetamorphose m11
  else
    scene = new mk.Scene m11
    scene.onSceneLoaded = onSceneLoaded
    view.addChild scene.perso.view

toggleDebug = () ->
  window.debug = !window.debug
  skeleton.setDebug window.debug
  skeleton.update()
  skeleton.view.bringToFront()
  scene.setDebug window.debug

onSceneLoaded = () ->
  windowResized()

# System Events

onRatio = (ratio) ->
  skeleton.dataRatio = ratio
  windowResized()
  console.log 'ratio set to '+ ratio

windowResized = (ev) ->
  viewport = 
    width  : paper.view.viewSize.width
    height : paper.view.viewSize.height
  if skeleton
    skeleton.resize viewport
  scene.resize viewport
  
  view.position.x = viewport.width * 0.5
  view.position.y = viewport.height * 0.5

onKeyDown = (ev) ->
  switch ev.keyCode
    when 83
      toggleDebug()

onTouchStart = (ev) ->
  toggleDebug()

onFrame = ->
  skeleton.update()
  scene.setPersoPose skeleton
  scene.update()

# NiTE events

onUserIn = (userId) ->
  console.log "user #{userId} entered"

onUserOut = (userId) ->
  console.log "user #{userId} exited"

onDataUpdated = () ->
  # perso.setPoseFromSkeleton skeleton


setup()
