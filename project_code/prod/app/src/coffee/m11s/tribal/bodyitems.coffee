class mk.m11s.tribal.BodyItems extends mk.m11s.base.BodyItems

  setupItems : ->
    @deform = false
    @deformSin = false

    @feathers = []

    @dreamcatcher = null
    @pattern = null

    delayed 500, => @addMask()
    # @addPattern()
    # @deformSin = true
    # for k,l of @sounds.loops.tribal
      # if k != 'basse_b' && k != 'deltafeu_b'
      # l.play()
      # if(k != 'tactac')
      #   l.volume 0
    
  addMask : ->
    symbol = @assets.symbols.tribal['head']
    MaskClass = m11Class 'Mask'
    @mask = new MaskClass symbol, @joints[NiTE.RIGHT_HAND], @joints[NiTE.HEAD]
    @mask.maskOnCallback = => 
      mk.Scene::sfx.play 'maskon'
      @startFire()
    @items.push @mask

  onMusicEvent : (evId) ->
    switch evId
      when 0
        @addFeathers()
      when 2
        mk.Scene::sfx.play 'scenechange'
        @deform = true
        for feather in @feathers
          for f in feather.feathers
            f.deform = true
        @stopFire()
        delayed 1000, =>
          mk.Scene::sfx.play 'scenechange'
          @addStars()
        delayed 2000, => @addDreamCatcher()
      when 3
        mk.Scene::sfx.play 'scenechange'
        @removeDreamCatcher()
        @removeStars()
        @addPattern()
        @deformSin = true


  startFire : ->
    @addFire()
    @addShadow()

  addFire : ->
    colors = [
      # @settings.palette.cream
      @settings.palette.lightRed
      @settings.palette.red
    ]
    @fire = new (m11Class 'Fire') colors
    @fire.view.position.x = -200
    @fire.view.position.y = window.viewport.height * 0.5 - 20
    @items.push @fire

  stopFire : ->
    fire = @fire
    if !fire then return
    new TWEEN.Tween({pct:fire.amp}).to({pct:0}, 1000)
    .start(window.currentTime)
    .onUpdate(->
      fire.setAmp @pct
    )
    .onComplete =>
      fire.clean()
      fire.view.remove()
      @items.splice @items.indexOf(fire),1

    @fire = null

    new TWEEN.Tween(@shadow.view).to({opacity:0}, 1000)
    .start(window.currentTime)
    .onComplete =>
      @shadow.view.remove()
      @items.splice @items.indexOf(@shadow),1
      @shadow = null

  addShadow : ->
    head = @joints[NiTE.HEAD]
    leftFoot = @joints[NiTE.LEFT_FOOT]
    rightFoot = @joints[NiTE.RIGHT_FOOT]
    shadow = new (m11Class 'Shadow') head, leftFoot, rightFoot
    @items.push shadow

    shadow.view.opacity = 0
    new TWEEN.Tween(shadow.view).to({opacity:1}, 1000)
    .onComplete(=> @shadow = shadow)
    .start window.currentTime


  addFeathers : ->

    part = @getPart 'leftLowerArm'
    item = new (m11Class 'FeatherGroup') @settings, part.joints[1], part.joints[0], 8, 0.7
    @feathers.push item
    @items.push item

    boomTime = 760 * 6

    delayed boomTime, =>
      part = @getPart 'rightLowerArm'
      item = new (m11Class 'FeatherGroup') @settings, part.joints[1], part.joints[0], 3, 0
      @feathers.push item
      @items.push item

    delayed boomTime*2, =>
      part = @getPart 'rightLowerLeg'
      item = new (m11Class 'FeatherGroup') @settings, part.joints[1], part.joints[0], 6, 0.3
      @feathers.push item
      @items.push item

    delayed boomTime*3, =>
      part = @getPart 'leftLowerLeg'
      item = new (m11Class 'FeatherGroup') @settings, part.joints[1], part.joints[0], 2, 0
      @feathers.push item
      @items.push item

  addStars : ->
    @stars = new mk.m11s.tribal.Stars @joints[NiTE.HEAD]
    @items.push @stars

  addDreamCatcher : ->
    @dreamcatcher = new mk.m11s.tribal.DreamCatcher @joints[NiTE.HEAD]
    @items.push @dreamcatcher

  removeStars : ->
    @stars.remove =>
      @stars.view.remove()
      @items.splice @items.indexOf(@stars),1

  removeDreamCatcher : ->
    @dreamcatcher.remove =>
      @dreamcatcher.view.remove()
      @items.splice @items.indexOf(@dreamcatcher),1

  addPattern : ->
    @pattern = new mk.m11s.tribal.Pattern [@joints[NiTE.LEFT_HAND], @joints[NiTE.RIGHT_HAND]]
    @items.push @pattern

  # ---

  update : (dt) ->
    super dt

    if @fire or @dreamcatcher

      lh = @joints[NiTE.LEFT_HAND]
      rh = @joints[NiTE.RIGHT_HAND]
      head = @joints[NiTE.HEAD]
      torso = @joints[NiTE.TORSO]
      lh_pct = (lh.y-torso.y) / (head.y-torso.y) * 0.7
      rh_pct = (rh.y-torso.y) / (head.y-torso.y) * 0.7
      pct = Math.min(Math.max(0, lh_pct+rh_pct), 1.3)

      if @fire
        @fire.setWind (lh.x + rh.x - 2 * torso.x) / 2 * 0.01

      for amper in [@fire, @dreamcatcher]
        if amper then amper.setAmp pct
      # if @shadow
      #   @shadow.view.opacity += (pct * 0.5 + 0.2 - @shadow.view.opacity) * 0.0025 * dt

    #snd = @sounds.loops.tribal.deltafeu_b
    #snd.volume pct+0.2