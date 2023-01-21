// Stats for Template Stage

{
	spriteContent: self.getResource().getContent("jellycar_stage"),
	animationId: "stage",
	ambientColor: 0x20fd8eff,
	shadowLayers: [
		{
			id: "0",
			maskSpriteContent: self.getResource().getContent("jellycar_stage"),
			maskAnimationId: "shadowMaskFront",
			color:0x40000000,
			foreground: true
		},
		{
			id: "1",
			maskSpriteContent: self.getResource().getContent("jellycar_stage"),
			maskAnimationId: "shadowMask",
			color:0x40000000,
			foreground: false
		}
	],
	camera: {
		startX : 0,
		startY : 43,
		zoomX : 0,
		zoomY : 0,
		camEaseRate : 1 / 11,
		camZoomRate : 1 / 15,
		minZoomHeight : 360,
		initialHeight: 360,
		initialWidth: 640,
		backgrounds: [
			{
				spriteContent: self.getResource().getContent("jellycar_stage"),
				animationId: "parallax0",
				mode: ParallaxMode.DEPTH,
				originalBGWidth: 800,
				originalBGHeight: 600,
				horizontalScroll: false,
				verticalScroll: false,
				loopWidth: 0,
				loopHeight: 0,
				xPanMultiplier: 0.1,
				yPanMultiplier: 0.1,
				scaleMultiplier: 1,
				foreground: false,
				depth: 2001
			}
		]
	}
}
