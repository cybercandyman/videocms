/*
Language: MEL
Description: Maya Embedded Language
Author: Shuen-Huei Guan <drake.guan@gmail.com>
*/

hljs.LANGUAGES.mel = {
  defaultMode: {
    lexems: [hljs.UNDERSCORE_IDENT_RE],
    illegal: '</',
    contains: ['number', 'string', 'variable', 'comment'],
    keywords: {'int': 1, 'float': 1, 'string': 1, 'float': 1, 'vector': 1, 'matrix': 1,
    'if': 1, 'else': 1, 'switch': 1, 'case': 1, 'default': 1, 'while': 1, 'do': 1, 'for': 1, 'in': 1, 'break': 1, 'continue': 1,
    'exists': 1, 'objExists': 1, 'attributeExists': 1,
    'global': 1, 'proc': 1, 'return': 1,
    'error': 1, 'warning': 1, 'trace': 1, 'catch': 1,
    'about': 1, 'abs': 1, 'addAttr': 1, 'addAttributeEditorNodeHelp': 1, 'addDynamic': 1, 'addNewShelfTab': 1, 'addPP': 1, 'addPanelCategory': 1, 'addPrefixToName': 1, 'advanceToNextDrivenKey': 1, 'affectedNet': 1, 'affects': 1, 'aimConstraint': 1, 'air': 1, 'alias': 1, 'aliasAttr': 1, 'align': 1, 'alignCtx': 1, 'alignCurve': 1, 'alignSurface': 1, 'allViewFit': 1, 'ambientLight': 1, 'angle': 1, 'angleBetween': 1, 'animCone': 1, 'animCurveEditor': 1, 'animDisplay': 1, 'animView': 1, 'annotate': 1, 'appendStringArray': 1, 'applicationName': 1, 'applyAttrPreset': 1, 'applyTake': 1, 'arcLenDimContext': 1, 'arcLengthDimension': 1, 'arclen': 1, 'arrayMapper': 1, 'art3dPaintCtx': 1, 'artAttrCtx': 1, 'artAttrPaintVertexCtx': 1, 'artAttrSkinPaintCtx': 1, 'artAttrTool': 1, 'artBuildPaintMenu': 1, 'artFluidAttrCtx': 1, 'artPuttyCtx': 1, 'artSelectCtx': 1, 'artSetPaintCtx': 1, 'artUserPaintCtx': 1, 'assignCommand': 1, 'assignInputDevice': 1, 'assignViewportFactories': 1, 'attachCurve': 1, 'attachDeviceAttr': 1, 'attachSurface': 1, 'attrColorSliderGrp': 1, 'attrCompatibility': 1, 'attrControlGrp': 1, 'attrEnumOptionMenu': 1, 'attrEnumOptionMenuGrp': 1, 'attrFieldGrp': 1, 'attrFieldSliderGrp': 1, 'attrNavigationControlGrp': 1, 'attrPresetEditWin': 1, 'attributeExists': 1, 'attributeInfo': 1, 'attributeMenu': 1, 'attributeQuery': 1, 'autoKeyframe': 1, 'autoPlace': 1, 'bakeClip': 1, 'bakeFluidShading': 1, 'bakePartialHistory': 1, 'bakeResults': 1, 'bakeSimulation': 1, 'basename': 1, 'basenameEx': 1, 'batchRender': 1, 'bessel': 1, 'bevel': 1, 'bevelPlus': 1, 'binMembership': 1, 'bindSkin': 1, 'blend2': 1, 'blendShape': 1, 'blendShapeEditor': 1, 'blendShapePanel': 1, 'blendTwoAttr': 1, 'blindDataType': 1, 'boneLattice': 1, 'boundary': 1, 'boxDollyCtx': 1, 'boxZoomCtx': 1, 'bufferCurve': 1, 'buildBookmarkMenu': 1, 'buildKeyframeMenu': 1, 'button': 1, 'buttonManip': 1, 'CBG': 1, 'cacheFile': 1, 'cacheFileCombine': 1, 'cacheFileMerge': 1, 'cacheFileTrack': 1, 'camera': 1, 'cameraView': 1, 'canCreateManip': 1, 'canvas': 1, 'capitalizeString': 1, 'catch': 1, 'catchQuiet': 1, 'ceil': 1, 'changeSubdivComponentDisplayLevel': 1, 'changeSubdivRegion': 1, 'channelBox': 1, 'character': 1, 'characterMap': 1, 'characterOutlineEditor': 1, 'characterize': 1, 'chdir': 1, 'checkBox': 1, 'checkBoxGrp': 1, 'checkDefaultRenderGlobals': 1, 'choice': 1, 'circle': 1, 'circularFillet': 1, 'clamp': 1, 'clear': 1, 'clearCache': 1, 'clip': 1, 'clipEditor': 1, 'clipEditorCurrentTimeCtx': 1, 'clipSchedule': 1, 'clipSchedulerOutliner': 1, 'clipTrimBefore': 1, 'closeCurve': 1, 'closeSurface': 1, 'cluster': 1, 'cmdFileOutput': 1, 'cmdScrollFieldExecuter': 1, 'cmdScrollFieldReporter': 1, 'cmdShell': 1, 'coarsenSubdivSelectionList': 1, 'collision': 1, 'color': 1, 'colorAtPoint': 1, 'colorEditor': 1, 'colorIndex': 1, 'colorIndexSliderGrp': 1, 'colorSliderButtonGrp': 1, 'colorSliderGrp': 1, 'columnLayout': 1, 'commandEcho': 1, 'commandLine': 1, 'commandPort': 1, 'compactHairSystem': 1, 'componentEditor': 1, 'compositingInterop': 1, 'computePolysetVolume': 1, 'condition': 1, 'cone': 1, 'confirmDialog': 1, 'connectAttr': 1, 'connectControl': 1, 'connectDynamic': 1, 'connectJoint': 1, 'connectionInfo': 1, 'constrain': 1, 'constrainValue': 1, 'constructionHistory': 1, 'container': 1, 'containsMultibyte': 1, 'contextInfo': 1, 'control': 1, 'convertFromOldLayers': 1, 'convertIffToPsd': 1, 'convertLightmap': 1, 'convertSolidTx': 1, 'convertTessellation': 1, 'convertUnit': 1, 'copyArray': 1, 'copyFlexor': 1, 'copyKey': 1, 'copySkinWeights': 1, 'cos': 1, 'cpButton': 1, 'cpCache': 1, 'cpClothSet': 1, 'cpCollision': 1, 'cpConstraint': 1, 'cpConvClothToMesh': 1, 'cpForces': 1, 'cpGetSolverAttr': 1, 'cpPanel': 1, 'cpProperty': 1, 'cpRigidCollisionFilter': 1, 'cpSeam': 1, 'cpSetEdit': 1, 'cpSetSolverAttr': 1, 'cpSolver': 1, 'cpSolverTypes': 1, 'cpTool': 1, 'cpUpdateClothUVs': 1, 'createDisplayLayer': 1, 'createDrawCtx': 1, 'createEditor': 1, 'createLayeredPsdFile': 1, 'createMotionField': 1, 'createNewShelf': 1, 'createNode': 1, 'createRenderLayer': 1, 'createSubdivRegion': 1, 'cross': 1, 'crossProduct': 1, 'ctxAbort': 1, 'ctxCompletion': 1, 'ctxEditMode': 1, 'ctxTraverse': 1, 'currentCtx': 1, 'currentTime': 1, 'currentTimeCtx': 1, 'currentUnit': 1, 'currentUnit': 1, 'curve': 1, 'curveAddPtCtx': 1, 'curveCVCtx': 1, 'curveEPCtx': 1, 'curveEditorCtx': 1, 'curveIntersect': 1, 'curveMoveEPCtx': 1, 'curveOnSurface': 1, 'curveSketchCtx': 1, 'cutKey': 1, 'cycleCheck': 1, 'cylinder': 1, 'dagPose': 1, 'date': 1, 'defaultLightListCheckBox': 1, 'defaultNavigation': 1, 'defineDataServer': 1, 'defineVirtualDevice': 1, 'deformer': 1, 'deg_to_rad': 1, 'delete': 1, 'deleteAttr': 1, 'deleteShadingGroupsAndMaterials': 1, 'deleteShelfTab': 1, 'deleteUI': 1, 'deleteUnusedBrushes': 1, 'delrandstr': 1, 'detachCurve': 1, 'detachDeviceAttr': 1, 'detachSurface': 1, 'deviceEditor': 1, 'devicePanel': 1, 'dgInfo': 1, 'dgdirty': 1, 'dgeval': 1, 'dgtimer': 1, 'dimWhen': 1, 'directKeyCtx': 1, 'directionalLight': 1, 'dirmap': 1, 'dirname': 1, 'disable': 1, 'disconnectAttr': 1, 'disconnectJoint': 1, 'diskCache': 1, 'displacementToPoly': 1, 'displayAffected': 1, 'displayColor': 1, 'displayCull': 1, 'displayLevelOfDetail': 1, 'displayPref': 1, 'displayRGBColor': 1, 'displaySmoothness': 1, 'displayStats': 1, 'displayString': 1, 'displaySurface': 1, 'distanceDimContext': 1, 'distanceDimension': 1, 'doBlur': 1, 'dolly': 1, 'dollyCtx': 1, 'dopeSheetEditor': 1, 'dot': 1, 'dotProduct': 1, 'doubleProfileBirailSurface': 1, 'drag': 1, 'dragAttrContext': 1, 'draggerContext': 1, 'dropoffLocator': 1, 'duplicate': 1, 'duplicateCurve': 1, 'duplicateSurface': 1, 'dynCache': 1, 'dynControl': 1, 'dynExport': 1, 'dynExpression': 1, 'dynGlobals': 1, 'dynPaintEditor': 1, 'dynParticleCtx': 1, 'dynPref': 1, 'dynRelEdPanel': 1, 'dynRelEditor': 1, 'dynamicLoad': 1, 'editAttrLimits': 1, 'editDisplayLayerGlobals': 1, 'editDisplayLayerMembers': 1, 'editRenderLayerAdjustment': 1, 'editRenderLayerGlobals': 1, 'editRenderLayerMembers': 1, 'editor': 1, 'editorTemplate': 1, 'effector': 1, 'emit': 1, 'emitter': 1, 'enableDevice': 1, 'encodeString': 1, 'endString': 1, 'endsWith': 1, 'env': 1, 'equivalent': 1, 'equivalentTol': 1, 'erf': 1, 'error': 1, 'eval': 1, 'eval': 1, 'evalDeferred': 1, 'evalEcho': 1, 'event': 1, 'exactWorldBoundingBox': 1, 'exclusiveLightCheckBox': 1, 'exec': 1, 'executeForEachObject': 1, 'exists': 1, 'exp': 1, 'expression': 1, 'expressionEditorListen': 1, 'extendCurve': 1, 'extendSurface': 1, 'extrude': 1, 'fcheck': 1, 'fclose': 1, 'feof': 1, 'fflush': 1, 'fgetline': 1, 'fgetword': 1, 'file': 1, 'fileBrowserDialog': 1, 'fileDialog': 1, 'fileExtension': 1, 'fileInfo': 1, 'filetest': 1, 'filletCurve': 1, 'filter': 1, 'filterCurve': 1, 'filterExpand': 1, 'filterStudioImport': 1, 'findAllIntersections': 1, 'findAnimCurves': 1, 'findKeyframe': 1, 'findMenuItem': 1, 'findRelatedSkinCluster': 1, 'finder': 1, 'firstParentOf': 1, 'fitBspline': 1, 'flexor': 1, 'floatEq': 1, 'floatField': 1, 'floatFieldGrp': 1, 'floatScrollBar': 1, 'floatSlider': 1, 'floatSlider2': 1, 'floatSliderButtonGrp': 1, 'floatSliderGrp': 1, 'floor': 1, 'flow': 1, 'fluidCacheInfo': 1, 'fluidEmitter': 1, 'fluidVoxelInfo': 1, 'flushUndo': 1, 'fmod': 1, 'fontDialog': 1, 'fopen': 1, 'formLayout': 1, 'format': 1, 'fprint': 1, 'frameLayout': 1, 'fread': 1, 'freeFormFillet': 1, 'frewind': 1, 'fromNativePath': 1, 'fwrite': 1, 'gamma': 1, 'gauss': 1, 'geometryConstraint': 1, 'getApplicationVersionAsFloat': 1, 'getAttr': 1, 'getClassification': 1, 'getDefaultBrush': 1, 'getFileList': 1, 'getFluidAttr': 1, 'getInputDeviceRange': 1, 'getMayaPanelTypes': 1, 'getModifiers': 1, 'getPanel': 1, 'getParticleAttr': 1, 'getPluginResource': 1, 'getenv': 1, 'getpid': 1, 'glRender': 1, 'glRenderEditor': 1, 'globalStitch': 1, 'gmatch': 1, 'goal': 1, 'gotoBindPose': 1, 'grabColor': 1, 'gradientControl': 1, 'gradientControlNoAttr': 1, 'graphDollyCtx': 1, 'graphSelectContext': 1, 'graphTrackCtx': 1, 'gravity': 1, 'grid': 1, 'gridLayout': 1, 'group': 1, 'groupObjectsByName': 1, 'HfAddAttractorToAS': 1, 'HfAssignAS': 1, 'HfBuildEqualMap': 1, 'HfBuildFurFiles': 1, 'HfBuildFurImages': 1, 'HfCancelAFR': 1, 'HfConnectASToHF': 1, 'HfCreateAttractor': 1, 'HfDeleteAS': 1, 'HfEditAS': 1, 'HfPerformCreateAS': 1, 'HfRemoveAttractorFromAS': 1, 'HfSelectAttached': 1, 'HfSelectAttractors': 1, 'HfUnAssignAS': 1, 'hardenPointCurve': 1, 'hardware': 1, 'hardwareRenderPanel': 1, 'headsUpDisplay': 1, 'headsUpMessage': 1, 'help': 1, 'helpLine': 1, 'hermite': 1, 'hide': 1, 'hilite': 1, 'hitTest': 1, 'hotBox': 1, 'hotkey': 1, 'hotkeyCheck': 1, 'hsv_to_rgb': 1, 'hudButton': 1, 'hudSlider': 1, 'hudSliderButton': 1, 'hwReflectionMap': 1, 'hwRender': 1, 'hwRenderLoad': 1, 'hyperGraph': 1, 'hyperPanel': 1, 'hyperShade': 1, 'hypot': 1, 'iconTextButton': 1, 'iconTextCheckBox': 1, 'iconTextRadioButton': 1, 'iconTextRadioCollection': 1, 'iconTextScrollList': 1, 'iconTextStaticLabel': 1, 'ikHandle': 1, 'ikHandleCtx': 1, 'ikHandleDisplayScale': 1, 'ikSolver': 1, 'ikSplineHandleCtx': 1, 'ikSystem': 1, 'ikSystemInfo': 1, 'ikfkDisplayMethod': 1, 'illustratorCurves': 1, 'image': 1, 'imfPlugins': 1, 'inheritTransform': 1, 'insertJoint': 1, 'insertJointCtx': 1, 'insertKeyCtx': 1, 'insertKnotCurve': 1, 'insertKnotSurface': 1, 'instance': 1, 'instanceable': 1, 'instancer': 1, 'intField': 1, 'intFieldGrp': 1, 'intScrollBar': 1, 'intSlider': 1, 'intSliderGrp': 1, 'interToUI': 1, 'internalVar': 1, 'intersect': 1, 'iprEngine': 1, 'isAnimCurve': 1, 'isConnected': 1, 'isDirty': 1, 'isParentOf': 1, 'isSameObject': 1, 'isTrue': 1, 'isValidObjectName': 1, 'isValidString': 1, 'isValidUiName': 1, 'isolateSelect': 1, 'itemFilter': 1, 'itemFilterAttr': 1, 'itemFilterRender': 1, 'itemFilterType': 1, 'joint': 1, 'jointCluster': 1, 'jointCtx': 1, 'jointDisplayScale': 1, 'jointLattice': 1, 'keyTangent': 1, 'keyframe': 1, 'keyframeOutliner': 1, 'keyframeRegionCurrentTimeCtx': 1, 'keyframeRegionDirectKeyCtx': 1, 'keyframeRegionDollyCtx': 1, 'keyframeRegionInsertKeyCtx': 1, 'keyframeRegionMoveKeyCtx': 1, 'keyframeRegionScaleKeyCtx': 1, 'keyframeRegionSelectKeyCtx': 1, 'keyframeRegionSetKeyCtx': 1, 'keyframeRegionTrackCtx': 1, 'keyframeStats': 1, 'lassoContext': 1, 'lattice': 1, 'latticeDeformKeyCtx': 1, 'launch': 1, 'launchImageEditor': 1, 'layerButton': 1, 'layeredShaderPort': 1, 'layeredTexturePort': 1, 'layout': 1, 'layoutDialog': 1, 'lightList': 1, 'lightListEditor': 1, 'lightListPanel': 1, 'lightlink': 1, 'lineIntersection': 1, 'linearPrecision': 1, 'linstep': 1, 'listAnimatable': 1, 'listAttr': 1, 'listCameras': 1, 'listConnections': 1, 'listDeviceAttachments': 1, 'listHistory': 1, 'listInputDeviceAxes': 1, 'listInputDeviceButtons': 1, 'listInputDevices': 1, 'listMenuAnnotation': 1, 'listNodeTypes': 1, 'listPanelCategories': 1, 'listRelatives': 1, 'listSets': 1, 'listTransforms': 1, 'listUnselected': 1, 'listerEditor': 1, 'loadFluid': 1, 'loadNewShelf': 1, 'loadPlugin': 1, 'loadPluginLanguageResources': 1, 'loadPrefObjects': 1, 'localizedPanelLabel': 1, 'lockNode': 1, 'loft': 1, 'log': 1, 'longNameOf': 1, 'lookThru': 1, 'ls': 1, 'lsThroughFilter': 1, 'lsType': 1, 'lsUI': 1, 'Mayatomr': 1, 'mag': 1, 'makeIdentity': 1, 'makeLive': 1, 'makePaintable': 1, 'makeRoll': 1, 'makeSingleSurface': 1, 'makeTubeOn': 1, 'makebot': 1, 'manipMoveContext': 1, 'manipMoveLimitsCtx': 1, 'manipOptions': 1, 'manipRotateContext': 1, 'manipRotateLimitsCtx': 1, 'manipScaleContext': 1, 'manipScaleLimitsCtx': 1, 'marker': 1, 'match': 1, 'max': 1, 'memory': 1, 'menu': 1, 'menuBarLayout': 1, 'menuEditor': 1, 'menuItem': 1, 'menuItemToShelf': 1, 'menuSet': 1, 'menuSetPref': 1, 'messageLine': 1, 'min': 1, 'minimizeApp': 1, 'mirrorJoint': 1, 'modelCurrentTimeCtx': 1, 'modelEditor': 1, 'modelPanel': 1, 'mouse': 1, 'movIn': 1, 'movOut': 1, 'move': 1, 'moveIKtoFK': 1, 'moveKeyCtx': 1, 'moveVertexAlongDirection': 1, 'multiProfileBirailSurface': 1, 'mute': 1, 'nParticle': 1, 'nameCommand': 1, 'nameField': 1, 'namespace': 1, 'namespaceInfo': 1, 'newPanelItems': 1, 'newton': 1, 'nodeCast': 1, 'nodeIconButton': 1, 'nodeOutliner': 1, 'nodePreset': 1, 'nodeType': 1, 'noise': 1, 'nonLinear': 1, 'normalConstraint': 1, 'normalize': 1, 'nurbsBoolean': 1, 'nurbsCopyUVSet': 1, 'nurbsCube': 1, 'nurbsEditUV': 1, 'nurbsPlane': 1, 'nurbsSelect': 1, 'nurbsSquare': 1, 'nurbsToPoly': 1, 'nurbsToPolygonsPref': 1, 'nurbsToSubdiv': 1, 'nurbsToSubdivPref': 1, 'nurbsUVSet': 1, 'nurbsViewDirectionVector': 1, 'objExists': 1, 'objectCenter': 1, 'objectLayer': 1, 'objectType': 1, 'objectTypeUI': 1, 'obsoleteProc': 1, 'oceanNurbsPreviewPlane': 1, 'offsetCurve': 1, 'offsetCurveOnSurface': 1, 'offsetSurface': 1, 'openGLExtension': 1, 'openMayaPref': 1, 'optionMenu': 1, 'optionMenuGrp': 1, 'optionVar': 1, 'orbit': 1, 'orbitCtx': 1, 'orientConstraint': 1, 'outlinerEditor': 1, 'outlinerPanel': 1, 'overrideModifier': 1, 'paintEffectsDisplay': 1, 'pairBlend': 1, 'palettePort': 1, 'paneLayout': 1, 'panel': 1, 'panelConfiguration': 1, 'panelHistory': 1, 'paramDimContext': 1, 'paramDimension': 1, 'paramLocator': 1, 'parent': 1, 'parentConstraint': 1, 'particle': 1, 'particleExists': 1, 'particleInstancer': 1, 'particleRenderInfo': 1, 'partition': 1, 'pasteKey': 1, 'pathAnimation': 1, 'pause': 1, 'pclose': 1, 'percent': 1, 'performanceOptions': 1, 'pfxstrokes': 1, 'pickWalk': 1, 'picture': 1, 'pixelMove': 1, 'planarSrf': 1, 'plane': 1, 'play': 1, 'playbackOptions': 1, 'playblast': 1, 'plugAttr': 1, 'plugNode': 1, 'pluginInfo': 1, 'pluginResourceUtil': 1, 'pointConstraint': 1, 'pointCurveConstraint': 1, 'pointLight': 1, 'pointMatrixMult': 1, 'pointOnCurve': 1, 'pointOnSurface': 1, 'pointPosition': 1, 'poleVectorConstraint': 1, 'polyAppend': 1, 'polyAppendFacetCtx': 1, 'polyAppendVertex': 1, 'polyAutoProjection': 1, 'polyAverageNormal': 1, 'polyAverageVertex': 1, 'polyBevel': 1, 'polyBlendColor': 1, 'polyBlindData': 1, 'polyBoolOp': 1, 'polyBridgeEdge': 1, 'polyCacheMonitor': 1, 'polyCheck': 1, 'polyChipOff': 1, 'polyClipboard': 1, 'polyCloseBorder': 1, 'polyCollapseEdge': 1, 'polyCollapseFacet': 1, 'polyColorBlindData': 1, 'polyColorDel': 1, 'polyColorPerVertex': 1, 'polyColorSet': 1, 'polyCompare': 1, 'polyCone': 1, 'polyCopyUV': 1, 'polyCrease': 1, 'polyCreaseCtx': 1, 'polyCreateFacet': 1, 'polyCreateFacetCtx': 1, 'polyCube': 1, 'polyCut': 1, 'polyCutCtx': 1, 'polyCylinder': 1, 'polyCylindricalProjection': 1, 'polyDelEdge': 1, 'polyDelFacet': 1, 'polyDelVertex': 1, 'polyDuplicateAndConnect': 1, 'polyDuplicateEdge': 1, 'polyEditUV': 1, 'polyEditUVShell': 1, 'polyEvaluate': 1, 'polyExtrudeEdge': 1, 'polyExtrudeFacet': 1, 'polyExtrudeVertex': 1, 'polyFlipEdge': 1, 'polyFlipUV': 1, 'polyForceUV': 1, 'polyGeoSampler': 1, 'polyHelix': 1, 'polyInfo': 1, 'polyInstallAction': 1, 'polyLayoutUV': 1, 'polyListComponentConversion': 1, 'polyMapCut': 1, 'polyMapDel': 1, 'polyMapSew': 1, 'polyMapSewMove': 1, 'polyMergeEdge': 1, 'polyMergeEdgeCtx': 1, 'polyMergeFacet': 1, 'polyMergeFacetCtx': 1, 'polyMergeUV': 1, 'polyMergeVertex': 1, 'polyMirrorFace': 1, 'polyMoveEdge': 1, 'polyMoveFacet': 1, 'polyMoveFacetUV': 1, 'polyMoveUV': 1, 'polyMoveVertex': 1, 'polyNormal': 1, 'polyNormalPerVertex': 1, 'polyNormalizeUV': 1, 'polyOptUvs': 1, 'polyOptions': 1, 'polyOutput': 1, 'polyPipe': 1, 'polyPlanarProjection': 1, 'polyPlane': 1, 'polyPlatonicSolid': 1, 'polyPoke': 1, 'polyPrimitive': 1, 'polyPrism': 1, 'polyProjection': 1, 'polyPyramid': 1, 'polyQuad': 1, 'polyQueryBlindData': 1, 'polyReduce': 1, 'polySelect': 1, 'polySelectConstraint': 1, 'polySelectConstraintMonitor': 1, 'polySelectCtx': 1, 'polySelectEditCtx': 1, 'polySeparate': 1, 'polySetToFaceNormal': 1, 'polySewEdge': 1, 'polyShortestPathCtx': 1, 'polySmooth': 1, 'polySoftEdge': 1, 'polySphere': 1, 'polySphericalProjection': 1, 'polySplit': 1, 'polySplitCtx': 1, 'polySplitEdge': 1, 'polySplitRing': 1, 'polySplitVertex': 1, 'polyStraightenUVBorder': 1, 'polySubdivideEdge': 1, 'polySubdivideFacet': 1, 'polyToSubdiv': 1, 'polyTorus': 1, 'polyTransfer': 1, 'polyTriangulate': 1, 'polyUVSet': 1, 'polyUnite': 1, 'polyWedgeFace': 1, 'popen': 1, 'popupMenu': 1, 'pose': 1, 'pow': 1, 'preloadRefEd': 1, 'print': 1, 'progressBar': 1, 'progressWindow': 1, 'projFileViewer': 1, 'projectCurve': 1, 'projectTangent': 1, 'projectionContext': 1, 'projectionManip': 1, 'promptDialog': 1, 'propModCtx': 1, 'propMove': 1, 'psdChannelOutliner': 1, 'psdEditTextureFile': 1, 'psdExport': 1, 'psdTextureFile': 1, 'putenv': 1, 'pwd': 1, 'python': 1, 'querySubdiv': 1, 'quit': 1, 'rad_to_deg': 1, 'radial': 1, 'radioButton': 1, 'radioButtonGrp': 1, 'radioCollection': 1, 'radioMenuItemCollection': 1, 'rampColorPort': 1, 'rand': 1, 'randomizeFollicles': 1, 'randstate': 1, 'rangeControl': 1, 'readTake': 1, 'rebuildCurve': 1, 'rebuildSurface': 1, 'recordAttr': 1, 'recordDevice': 1, 'redo': 1, 'reference': 1, 'referenceEdit': 1, 'referenceQuery': 1, 'refineSubdivSelectionList': 1, 'refresh': 1, 'refreshAE': 1, 'registerPluginResource': 1, 'rehash': 1, 'reloadImage': 1, 'removeJoint': 1, 'removeMultiInstance': 1, 'removePanelCategory': 1, 'rename': 1, 'renameAttr': 1, 'renameSelectionList': 1, 'renameUI': 1, 'render': 1, 'renderGlobalsNode': 1, 'renderInfo': 1, 'renderLayerButton': 1, 'renderLayerParent': 1, 'renderLayerPostProcess': 1, 'renderLayerUnparent': 1, 'renderManip': 1, 'renderPartition': 1, 'renderQualityNode': 1, 'renderSettings': 1, 'renderThumbnailUpdate': 1, 'renderWindowEditor': 1, 'renderWindowSelectContext': 1, 'renderer': 1, 'reorder': 1, 'reorderDeformers': 1, 'requires': 1, 'reroot': 1, 'resampleFluid': 1, 'resetAE': 1, 'resetPfxToPolyCamera': 1, 'resetTool': 1, 'resolutionNode': 1, 'retarget': 1, 'reverseCurve': 1, 'reverseSurface': 1, 'revolve': 1, 'rgb_to_hsv': 1, 'rigidBody': 1, 'rigidSolver': 1, 'roll': 1, 'rollCtx': 1, 'rootOf': 1, 'rot': 1, 'rotate': 1, 'rotationInterpolation': 1, 'roundConstantRadius': 1, 'rowColumnLayout': 1, 'rowLayout': 1, 'runTimeCommand': 1, 'runup': 1, 'sampleImage': 1, 'saveAllShelves': 1, 'saveAttrPreset': 1, 'saveFluid': 1, 'saveImage': 1, 'saveInitialState': 1, 'saveMenu': 1, 'savePrefObjects': 1, 'savePrefs': 1, 'saveShelf': 1, 'saveToolSettings': 1, 'scale': 1, 'scaleBrushBrightness': 1, 'scaleComponents': 1, 'scaleConstraint': 1, 'scaleKey': 1, 'scaleKeyCtx': 1, 'sceneEditor': 1, 'sceneUIReplacement': 1, 'scmh': 1, 'scriptCtx': 1, 'scriptEditorInfo': 1, 'scriptJob': 1, 'scriptNode': 1, 'scriptTable': 1, 'scriptToShelf': 1, 'scriptedPanel': 1, 'scriptedPanelType': 1, 'scrollField': 1, 'scrollLayout': 1, 'sculpt': 1, 'searchPathArray': 1, 'seed': 1, 'selLoadSettings': 1, 'select': 1, 'selectContext': 1, 'selectCurveCV': 1, 'selectKey': 1, 'selectKeyCtx': 1, 'selectKeyframeRegionCtx': 1, 'selectMode': 1, 'selectPref': 1, 'selectPriority': 1, 'selectType': 1, 'selectedNodes': 1, 'selectionConnection': 1, 'separator': 1, 'setAttr': 1, 'setAttrEnumResource': 1, 'setAttrMapping': 1, 'setAttrNiceNameResource': 1, 'setConstraintRestPosition': 1, 'setDefaultShadingGroup': 1, 'setDrivenKeyframe': 1, 'setDynamic': 1, 'setEditCtx': 1, 'setEditor': 1, 'setFluidAttr': 1, 'setFocus': 1, 'setInfinity': 1, 'setInputDeviceMapping': 1, 'setKeyCtx': 1, 'setKeyPath': 1, 'setKeyframe': 1, 'setKeyframeBlendshapeTargetWts': 1, 'setMenuMode': 1, 'setNodeNiceNameResource': 1, 'setNodeTypeFlag': 1, 'setParent': 1, 'setParticleAttr': 1, 'setPfxToPolyCamera': 1, 'setPluginResource': 1, 'setProject': 1, 'setStampDensity': 1, 'setStartupMessage': 1, 'setState': 1, 'setToolTo': 1, 'setUITemplate': 1, 'setXformManip': 1, 'sets': 1, 'shadingConnection': 1, 'shadingGeometryRelCtx': 1, 'shadingLightRelCtx': 1, 'shadingNetworkCompare': 1, 'shadingNode': 1, 'shapeCompare': 1, 'shelfButton': 1, 'shelfLayout': 1, 'shelfTabLayout': 1, 'shellField': 1, 'shortNameOf': 1, 'showHelp': 1, 'showHidden': 1, 'showManipCtx': 1, 'showSelectionInTitle': 1, 'showShadingGroupAttrEditor': 1, 'showWindow': 1, 'sign': 1, 'simplify': 1, 'sin': 1, 'singleProfileBirailSurface': 1, 'size': 1, 'sizeBytes': 1, 'skinCluster': 1, 'skinPercent': 1, 'smoothCurve': 1, 'smoothTangentSurface': 1, 'smoothstep': 1, 'snap2to2': 1, 'snapKey': 1, 'snapMode': 1, 'snapTogetherCtx': 1, 'snapshot': 1, 'soft': 1, 'softMod': 1, 'softModCtx': 1, 'sort': 1, 'sound': 1, 'soundControl': 1, 'source': 1, 'spaceLocator': 1, 'sphere': 1, 'sphrand': 1, 'spotLight': 1, 'spotLightPreviewPort': 1, 'spreadSheetEditor': 1, 'spring': 1, 'sqrt': 1, 'squareSurface': 1, 'srtContext': 1, 'stackTrace': 1, 'startString': 1, 'startsWith': 1, 'stitchAndExplodeShell': 1, 'stitchSurface': 1, 'stitchSurfacePoints': 1, 'strcmp': 1, 'stringArrayCatenate': 1, 'stringArrayContains': 1, 'stringArrayCount': 1, 'stringArrayInsertAtIndex': 1, 'stringArrayIntersector': 1, 'stringArrayRemove': 1, 'stringArrayRemoveAtIndex': 1, 'stringArrayRemoveDuplicates': 1, 'stringArrayRemoveExact': 1, 'stringArrayToString': 1, 'stringToStringArray': 1, 'strip': 1, 'stripPrefixFromName': 1, 'stroke': 1, 'subdAutoProjection': 1, 'subdCleanTopology': 1, 'subdCollapse': 1, 'subdDuplicateAndConnect': 1, 'subdEditUV': 1, 'subdListComponentConversion': 1, 'subdMapCut': 1, 'subdMapSewMove': 1, 'subdMatchTopology': 1, 'subdMirror': 1, 'subdToBlind': 1, 'subdToPoly': 1, 'subdTransferUVsToCache': 1, 'subdiv': 1, 'subdivCrease': 1, 'subdivDisplaySmoothness': 1, 'substitute': 1, 'substituteAllString': 1, 'substituteGeometry': 1, 'substring': 1, 'surface': 1, 'surfaceSampler': 1, 'surfaceShaderList': 1, 'swatchDisplayPort': 1, 'switchTable': 1, 'symbolButton': 1, 'symbolCheckBox': 1, 'sysFile': 1, 'system': 1, 'tabLayout': 1, 'tan': 1, 'tangentConstraint': 1, 'texLatticeDeformContext': 1, 'texManipContext': 1, 'texMoveContext': 1, 'texMoveUVShellContext': 1, 'texRotateContext': 1, 'texScaleContext': 1, 'texSelectContext': 1, 'texSelectShortestPathCtx': 1, 'texSmudgeUVContext': 1, 'texWinToolCtx': 1, 'text': 1, 'textCurves': 1, 'textField': 1, 'textFieldButtonGrp': 1, 'textFieldGrp': 1, 'textManip': 1, 'textScrollList': 1, 'textToShelf': 1, 'textureDisplacePlane': 1, 'textureHairColor': 1, 'texturePlacementContext': 1, 'textureWindow': 1, 'threadCount': 1, 'threePointArcCtx': 1, 'timeControl': 1, 'timePort': 1, 'timerX': 1, 'toNativePath': 1, 'toggle': 1, 'toggleAxis': 1, 'toggleWindowVisibility': 1, 'tokenize': 1, 'tokenizeList': 1, 'tolerance': 1, 'tolower': 1, 'toolButton': 1, 'toolCollection': 1, 'toolDropped': 1, 'toolHasOptions': 1, 'toolPropertyWindow': 1, 'torus': 1, 'toupper': 1, 'trace': 1, 'track': 1, 'trackCtx': 1, 'transferAttributes': 1, 'transformCompare': 1, 'transformLimits': 1, 'translator': 1, 'trim': 1, 'trunc': 1, 'truncateFluidCache': 1, 'truncateHairCache': 1, 'tumble': 1, 'tumbleCtx': 1, 'turbulence': 1, 'twoPointArcCtx': 1, 'uiRes': 1, 'uiTemplate': 1, 'unassignInputDevice': 1, 'undo': 1, 'undoInfo': 1, 'ungroup': 1, 'uniform': 1, 'unit': 1, 'unloadPlugin': 1, 'untangleUV': 1, 'untitledFileName': 1, 'untrim': 1, 'upAxis': 1, 'updateAE': 1, 'userCtx': 1, 'uvLink': 1, 'uvSnapshot': 1, 'validateShelfName': 1, 'vectorize': 1, 'view2dToolCtx': 1, 'viewCamera': 1, 'viewClipPlane': 1, 'viewFit': 1, 'viewHeadOn': 1, 'viewLookAt': 1, 'viewManip': 1, 'viewPlace': 1, 'viewSet': 1, 'visor': 1, 'volumeAxis': 1, 'vortex': 1, 'waitCursor': 1, 'warning': 1, 'webBrowser': 1, 'webBrowserPrefs': 1, 'whatIs': 1, 'window': 1, 'windowPref': 1, 'wire': 1, 'wireContext': 1, 'workspace': 1, 'wrinkle': 1, 'wrinkleContext': 1, 'writeTake': 1, 'xbmLangPathList': 1, 'xform': 1
     }
  },
  modes: [
    // number
    hljs.C_NUMBER_MODE,
    // string
    hljs.APOS_STRING_MODE,
    hljs.QUOTE_STRING_MODE,
    hljs.BACKSLASH_ESCAPE,
    {
      className: 'string',
      begin: '`', end: '`',
      contains: ['escape']
    },
    // variable
    {
      className: 'variable',
      begin: '\\$\\d', end: '^',
      relevance: 5
    },
    {
      className: 'variable',
      begin: '[\\$\\%\\@\\*](\\^\\w\\b|#\\w+|[^\\s\\w{]|{\\w+}|\\w+)', end: '^'
    },
    // array, $a[3] = {"a","b","c"}, $b[3] = {1,2,3}
    // vector, $test = <<3.0, 7.7, 9.1>>
    // matrix, matrix $a3[3][4] = <<2.5, 4.5, 3.25, 8.05; ... >>
    // param, -name ... -radius ...
    // operator, () [] ! ++ -- * / % ^ + - < <= > >= == != && || ? : = += -= *= /=
    // comment
    hljs.C_LINE_COMMENT_MODE,
    hljs.C_BLOCK_COMMENT_MODE
  ]
};
