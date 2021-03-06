class mk.m11s.thorns.BodyItems extends mk.m11s.base.BodyItems

  setupItems: () ->
    @addBodyPeaks()
    @addHeadPeak()
    @addFlowers()

  addBodyPeaks: () ->
    symbs = ['peak1', 'peak2']
    parts = @getPartsExcluding ['head']
    rngk = 'addBodyPeaks'
    for p in parts
      for i in [1..3]
        if rng(rngk) > 0.3
          symbol = @assets.symbols.thorns[symbs.seedRandom(rngk)]
          item = new mk.helpers.SimplePartItem symbol, p, 'Peak'+@items.length
          item.view.scale rng(rngk)*0.3 + 1
          item.view.rotation = Math.floor(rng(rngk)*2) * 180
          @items.push item
    
  addHeadPeak: () ->
    symbol = @assets.symbols.thorns['head']
    item = new mk.helpers.SimpleJointItem symbol, @joints[NiTE.HEAD], 200
    item.view.scale 1.5
    @items.push item

  addFlowers: () ->
    symbs = ['flower1', 'flower2', 'flower3']
    parts = @getParts ['leftLowerLeg', 'rightLowerArm', 'leftUpperArm', 'leftLowerArm', 'rightUpperArm', 'rightLowerArm' ]
    rngk = 'addBodyPeaks'
    for p in parts
      if rng(rngk) > 0.5
        symbol = @assets.symbols.thorns[symbs.seedRandom(rngk)]
        item = new mk.helpers.SimplePartItem symbol, p, 'Flower'
        item.view.rotation = Math.floor(rng(rngk)*2) * 180
        @items.push item