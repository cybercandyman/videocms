/**
 * usage
 * <div class="toggle"><input type="checkbox" name="4_answer" /></div>
 * $('.toggle :checkbox').iphoneStyle();
 */
(function($) {
	$.fn.hoverIntent = function(f, g) {
		var cfg = {
			sensitivity : 7,
			interval : 100,
			timeout : 0
		};
		cfg = $.extend(cfg, g ? {
			over : f,
			out : g
		} : f);
		var cX, cY, pX, pY;
		var track = function(ev) {
			cX = ev.pageX;
			cY = ev.pageY
		};
		var compare = function(ev, ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) {
				$(ob).unbind("mousemove", track);
				ob.hoverIntent_s = 1;
				return cfg.over.apply(ob, [ ev ])
			} else {
				pX = cX;
				pY = cY;
				ob.hoverIntent_t = setTimeout(function() {
					compare(ev, ob)
				}, cfg.interval)
			}
		};
		var delay = function(ev, ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			ob.hoverIntent_s = 0;
			return cfg.out.apply(ob, [ ev ])
		};
		var handleHover = function(e) {
			var p = (e.type == "mouseover" ? e.fromElement : e.toElement)
					|| e.relatedTarget;
			while (p && p != this) {
				try {
					p = p.parentNode
				} catch (e) {
					p = this
				}
			}
			if (p == this) {
				return false
			}
			var ev = jQuery.extend( {}, e);
			var ob = this;
			if (ob.hoverIntent_t) {
				ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t)
			}
			if (e.type == "mouseover") {
				pX = ev.pageX;
				pY = ev.pageY;
				$(ob).bind("mousemove", track);
				if (ob.hoverIntent_s != 1) {
					ob.hoverIntent_t = setTimeout(function() {
						compare(ev, ob)
					}, cfg.interval)
				}
			} else {
				$(ob).unbind("mousemove", track);
				if (ob.hoverIntent_s == 1) {
					ob.hoverIntent_t = setTimeout(function() {
						delay(ev, ob)
					}, cfg.timeout)
				}
			}
		};
		return this.mouseover(handleHover).mouseout(handleHover)
	}
})(jQuery);
(function($) {
	$.InFieldLabels = function(b, c, d) {
		var f = this;
		f.$label = $(b);
		f.label = b;
		f.$field = $(c);
		f.field = c;
		f.$label.data("InFieldLabels", f);
		f.showing = true;
		f.init = function() {
			f.options = $.extend( {}, $.InFieldLabels.defaultOptions, d);
			if (f.$field.val() != "") {
				f.$label.hide();
				f.showing = false
			}
			;
			f.$field.focus(function() {
				f.fadeOnFocus()
			}).blur(function() {
				f.checkForEmpty(true)
			}).bind('keydown.infieldlabel', function(e) {
				f.hideOnChange(e)
			}).change(function(e) {
				f.checkForEmpty()
			}).bind('onPropertyChange', function() {
				f.checkForEmpty()
			})
		};
		f.fadeOnFocus = function() {
			if (f.showing) {
				f.setOpacity(f.options.fadeOpacity)
			}
		};
		f.setOpacity = function(a) {
			f.$label.stop().animate( {
				opacity : a
			}, f.options.fadeDuration);
			f.showing = (a > 0.0)
		};
		f.checkForEmpty = function(a) {
			if (f.$field.val() == "") {
				f.prepForShow();
				f.setOpacity(a ? 1.0 : f.options.fadeOpacity)
			} else {
				f.setOpacity(0.0)
			}
		};
		f.prepForShow = function(e) {
			if (!f.showing) {
				f.$label.css( {
					opacity : 0.0
				}).show();
				f.$field.bind('keydown.infieldlabel', function(e) {
					f.hideOnChange(e)
				})
			}
		};
		f.hideOnChange = function(e) {
			if ((e.keyCode == 16) || (e.keyCode == 9))
				return;
			if (f.showing) {
				f.$label.hide();
				f.showing = false
			}
			;
			f.$field.unbind('keydown.infieldlabel')
		};
		f.init()
	};
	$.InFieldLabels.defaultOptions = {
		fadeOpacity : 0.5,
		fadeDuration : 300
	};
	$.fn.inFieldLabels = function(c) {
		return this.each(function() {
			var a = $(this).attr('for');
			if (!a)
				return;
			var b = $("input#" + a + "[type='text']," + "input#" + a
					+ "[type='password']," + "textarea#" + a);
			if (b.length == 0)
				return;
			(new $.InFieldLabels(this, b[0], c))
		})
	}
})(jQuery);
function limitcharacters() {
	$('textarea').each(function() {
		var maxlimit = 200;
		var length = $(this).val().length;
		if (length >= maxlimit) {
			$(this).val($(this).val().substring(0, maxlimit));
			length = maxlimit
		}
		var characters = maxlimit - length;
		$(this).parent().find('span').html(characters);
		$(this).keyup(function() {
			var new_length = $(this).val().length;
			var charactersupdate = maxlimit - new_length;
			if (new_length >= maxlimit) {
				$(this).val($(this).val().substring(0, maxlimit));
				new_length = maxlimit
			}
			$(this).parent().find('span').html(charactersupdate)
		})
	})
};
(function($, iphoneStyle) {
	$[iphoneStyle] = function(elem, options) {
		this.$elem = $(elem);
		var obj = this;
		$.each(options, function(key, value) {
			obj[key] = value
		});
		this.wrapCheckboxWithDivs();
		this.attachEvents();
		this.disableTextSelection();
		if (this.resizeHandle) {
			this.optionallyResize('handle')
		}
		if (this.resizeContainer) {
			this.optionallyResize('container')
		}
		this.initialPosition()
	};
	$
			.extend(
					$[iphoneStyle].prototype,
					{
						wrapCheckboxWithDivs : function() {
							this.$elem
									.wrap('<div class="' + this.containerClass + '" />');
							this.container = this.$elem.parent();
							this.offLabel = $(
									'<label class="' + this.labelOffClass
											+ '">' + '<span>'
											+ this.uncheckedLabel + '</span>'
											+ '</label>').appendTo(
									this.container);
							this.offSpan = this.offLabel.children('span');
							this.onLabel = $(
									'<label class="' + this.labelOnClass + '">'
											+ '<span>' + this.checkedLabel
											+ '</span>' + '</label>').appendTo(
									this.container);
							this.onSpan = this.onLabel.children('span');
							this.handle = $(
									'<div class="' + this.handleClass + '">'
											+ '<div class="'
											+ this.handleRightClass + '">'
											+ '<div class="'
											+ this.handleCenterClass + '" />'
											+ '</div>' + '</div>').appendTo(
									this.container)
						},
						disableTextSelection : function() {
							if (!$.browser.msie) {
								return
							}
							$.each( [ this.handle, this.offLabel, this.onLabel,
									this.container ], function(el) {
								$(el).attr("unselectable", "on")
							})
						},
						optionallyResize : function(mode) {
							var onLabelWidth = this.onLabel.width(), offLabelWidth = this.offLabel
									.width(), newWidth = (onLabelWidth < offLabelWidth) ? onLabelWidth
									: offLabelWidth;
							if (mode == 'container') {
								newWidth += this.handle.width() + 15
							}
							this[mode].css( {
								width : newWidth
							})
						},
						attachEvents : function() {
							var obj = this;
							this.container
									.bind(
											'mousedown touchstart',
											function(event) {
												event.preventDefault();
												if (obj.$elem.is(':disabled')) {
													return
												}
												var x = event.pageX
														|| event.originalEvent.changedTouches[0].pageX;
												$[iphoneStyle].currentlyClicking = obj.handle;
												$[iphoneStyle].dragStartPosition = x;
												$[iphoneStyle].handleLeftOffset = parseInt(
														obj.handle.css('left'),
														10) || 0
											})
									.bind(
											'iPhoneDrag',
											function(event, x) {
												event.preventDefault();
												if (obj.$elem.is(':disabled')) {
													return
												}
												var p = (x
														+ $[iphoneStyle].handleLeftOffset - $[iphoneStyle].dragStartPosition)
														/ obj.rightSide;
												if (p < 0) {
													p = 0
												}
												if (p > 1) {
													p = 1
												}
												obj.handle.css( {
													left : p * obj.rightSide
												});
												obj.onLabel.css( {
													width : p * obj.rightSide
															+ 4
												});
												obj.offSpan.css( {
													marginRight : -p
															* obj.rightSide
												});
												obj.onSpan.css( {
													marginLeft : -(1 - p)
															* obj.rightSide
												})
											})
									.bind(
											'iPhoneDragEnd',
											function(event, x) {
												if (obj.$elem.is(':disabled')) {
													return
												}
												if ($[iphoneStyle].dragging) {
													var p = (x - $[iphoneStyle].dragStartPosition)
															/ obj.rightSide;
													obj.$elem.attr('checked',
															(p >= 0.5));
													if (obj.$elem
															.attr('checked')) {
														$(this).parent()
																.parent()
																.find('.tick')
																.fadeIn();
														$(this)
																.parent()
																.parent()
																.find('.toggle')
																.addClass(
																		'checked')
													} else {
														$(this).parent()
																.parent()
																.find('.tick')
																.fadeOut();
														$(this)
																.parent()
																.parent()
																.find('.toggle')
																.removeClass(
																		'checked')
													}
												} else {
													obj.$elem
															.attr(
																	'checked',
																	!obj.$elem
																			.attr('checked'));
													if (obj.$elem
															.attr('checked')) {
														$(this).parent()
																.parent()
																.find('.tick')
																.fadeIn();
														$(this)
																.parent()
																.parent()
																.find('.toggle')
																.addClass(
																		'checked')
													} else {
														$(this).parent()
																.parent()
																.find('.tick')
																.fadeOut();
														$(this)
																.parent()
																.parent()
																.find('.toggle')
																.removeClass(
																		'checked')
													}
												}
												$[iphoneStyle].currentlyClicking = null;
												$[iphoneStyle].dragging = null;
												obj.$elem.change()
											});
							this.$elem
									.change(function() {
										if (obj.$elem.is(':disabled')) {
											obj.container
													.addClass(obj.disabledClass);
											return false
										} else {
											obj.container
													.removeClass(obj.disabledClass)
										}
										var new_left = obj.$elem
												.attr('checked') ? obj.rightSide
												: 0;
										obj.handle.animate( {
											left : new_left
										}, obj.duration);
										obj.onLabel.animate( {
											width : new_left + 4
										}, obj.duration);
										obj.offSpan.animate( {
											marginRight : -new_left
										}, obj.duration);
										obj.onSpan.animate( {
											marginLeft : new_left
													- obj.rightSide
										}, obj.duration)
									})
						},
						initialPosition : function() {
							this.offLabel.css( {
								width : this.container.width()
							});
							var offset = ($.browser.msie && $.browser.version < 7) ? 3
									: 6;
							this.rightSide = this.container.width()
									- this.handle.width();
							if (this.$elem.is(':checked')) {
								this.handle.css( {
									left : this.rightSide
								});
								this.onLabel.css( {
									width : this.rightSide
								});
								this.offSpan.css( {
									marginRight : -this.rightSide
								})
							} else {
								this.onLabel.css( {
									width : 0
								});
								this.onSpan.css( {
									marginLeft : -this.rightSide
								})
							}
							if (this.$elem.is(':disabled')) {
								this.container.addClass(this.disabledClass)
							}
						}
					});
	$.fn[iphoneStyle] = function(options) {
		var checkboxes = this.filter(':checkbox');
		if (!checkboxes.length) {
			return this
		}
		var opt = $.extend( {}, $[iphoneStyle].defaults, options);
		checkboxes.each(function() {
			$(this).data(iphoneStyle, new $[iphoneStyle](this, opt))
		});
		if (!$[iphoneStyle].initComplete) {
			$(document).bind(
					'mousemove touchmove',
					function(event) {
						if (!$[iphoneStyle].currentlyClicking) {
							return
						}
						event.preventDefault();
						var x = event.pageX
								|| event.originalEvent.changedTouches[0].pageX;
						if (!$[iphoneStyle].dragging
								&& (Math.abs($[iphoneStyle].dragStartPosition
										- x) > opt.dragThreshold)) {
							$[iphoneStyle].dragging = true
						}
						$(event.target).trigger('iPhoneDrag', [ x ])
					}).bind(
					'mouseup touchend',
					function(event) {
						if (!$[iphoneStyle].currentlyClicking) {
							return
						}
						event.preventDefault();
						var x = event.pageX
								|| event.originalEvent.changedTouches[0].pageX;
						$($[iphoneStyle].currentlyClicking).trigger(
								'iPhoneDragEnd', [ x ])
					});
			$[iphoneStyle].initComplete = true
		}
		return this
	};
	$[iphoneStyle].defaults = {
		duration : 200,
		checkedLabel : 'YES',
		uncheckedLabel : 'NO',
		resizeHandle : false,
		resizeContainer : false,
		disabledClass : 'iPhoneCheckDisabled',
		containerClass : 'iPhoneCheckContainer',
		labelOnClass : 'iPhoneCheckLabelOn',
		labelOffClass : 'iPhoneCheckLabelOff',
		handleClass : 'iPhoneCheckHandle',
		handleCenterClass : 'iPhoneCheckHandleCenter',
		handleRightClass : 'iPhoneCheckHandleRight',
		dragThreshold : 5
	}
})(jQuery, 'iphoneStyle');
jQuery.preloadCssImages = function(settings) {
	settings = jQuery.extend( {
		statusTextEl : null,
		statusBarEl : null,
		errorDelay : 999,
		simultaneousCacheLoading : 2
	}, settings);
	var allImgs = [], loaded = 0, imgUrls = [], thisSheetRules, errorTimer;
	function onImgComplete() {
		clearTimeout(errorTimer);
		if (imgUrls && imgUrls.length && imgUrls[loaded]) {
			loaded++;
			if (settings.statusTextEl) {
				var nowloading = (imgUrls[loaded]) ? 'Now Loading: <span>' + imgUrls[loaded]
						.split('/')[imgUrls[loaded].split('/').length - 1]
						: 'Loading complete';
				jQuery(settings.statusTextEl)
						.html(
								'<span class="numLoaded">'
										+ loaded
										+ '</span> of <span class="numTotal">'
										+ imgUrls.length
										+ '</span> loaded (<span class="percentLoaded">'
										+ (loaded / imgUrls.length * 100)
												.toFixed(0)
										+ '%</span>) <span class="currentImg">'
										+ nowloading + '</span></span>')
			}
			if (settings.statusBarEl) {
				var barWidth = jQuery(settings.statusBarEl).width();
				jQuery(settings.statusBarEl).css(
						'background-position',
						-(barWidth - (barWidth * loaded / imgUrls.length)
								.toFixed(0)) + 'px 50%')
			}
			loadImgs()
		}
	}
	function loadImgs() {
		if (imgUrls && imgUrls.length && imgUrls[loaded]) {
			var img = new Image();
			img.src = imgUrls[loaded];
			if (!img.complete) {
				jQuery(img)
						.bind('error load onreadystatechange', onImgComplete)
			} else {
				onImgComplete()
			}
			errorTimer = setTimeout(onImgComplete, settings.errorDelay)
		}
	}
	function parseCSS(sheets, urls) {
		var w3cImport = false, imported = [], importedSrc = [], baseURL;
		var sheetIndex = sheets.length;
		while (sheetIndex--) {
			var cssPile = '';
			if (urls && urls[sheetIndex]) {
				baseURL = urls[sheetIndex]
			} else {
				var csshref = (sheets[sheetIndex].href) ? sheets[sheetIndex].href
						: 'window.location.href';
				var baseURLarr = csshref.split('/');
				baseURLarr.pop();
				baseURL = baseURLarr.join('/');
				if (baseURL) {
					baseURL += '/'
				}
			}
			if (sheets[sheetIndex].cssRules || sheets[sheetIndex].rules) {
				thisSheetRules = (sheets[sheetIndex].cssRules) ? sheets[sheetIndex].cssRules
						: sheets[sheetIndex].rules;
				var ruleIndex = thisSheetRules.length;
				while (ruleIndex--) {
					if (thisSheetRules[ruleIndex].style
							&& thisSheetRules[ruleIndex].style.cssText) {
						var text = thisSheetRules[ruleIndex].style.cssText;
						if (text.toLowerCase().indexOf('url') != -1) {
							cssPile += text
						}
					} else if (thisSheetRules[ruleIndex].styleSheet) {
						imported.push(thisSheetRules[ruleIndex].styleSheet);
						w3cImport = true
					}
				}
			}
			var tmpImage = cssPile.match(/[^\("]+\.(gif|jpg|jpeg|png)/g);
			if (tmpImage) {
				var i = tmpImage.length;
				while (i--) {
					var imgSrc = (tmpImage[i].charAt(0) == '/' || tmpImage[i]
							.match('://')) ? tmpImage[i] : baseURL
							+ tmpImage[i];
					if (jQuery.inArray(imgSrc, imgUrls) == -1) {
						imgUrls.push(imgSrc)
					}
				}
			}
			if (!w3cImport && sheets[sheetIndex].imports
					&& sheets[sheetIndex].imports.length) {
				for ( var iImport = 0, importLen = sheets[sheetIndex].imports.length; iImport < importLen; iImport++) {
					var iHref = sheets[sheetIndex].imports[iImport].href;
					iHref = iHref.split('/');
					iHref.pop();
					iHref = iHref.join('/');
					if (iHref) {
						iHref += '/'
					}
					var iSrc = (iHref.charAt(0) == '/' || iHref.match('://')) ? iHref
							: baseURL + iHref;
					importedSrc.push(iSrc);
					imported.push(sheets[sheetIndex].imports[iImport])
				}
			}
		}
		if (imported.length) {
			parseCSS(imported, importedSrc);
			return false
		}
		var downloads = settings.simultaneousCacheLoading;
		while (downloads--) {
			setTimeout(loadImgs, downloads)
		}
	}
	parseCSS(document.styleSheets);
	return imgUrls
};