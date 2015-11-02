var commands = document.getElementById("commands");
			var cmdFontSize = document.getElementById("cmdFontSize");
			var cmdColor = document.getElementById("cmdColor");
			EventUtil.addHandler(window, "load", function(){
                frames["richedit"].document.designMode = "on";
            });
            EventUtil.addHandler(commands, "click", function(event){
                event = EventUtil.getEvent(event);
                var target = EventUtil.getTarget(event);
                
                if (target.type == "button"){    
                    frames["richedit"].document.execCommand(target.value.toLowerCase(), false, null);                        
                }    
            });
            EventUtil.addHandler(cmdFontSize, "change", function(event){
            	event = EventUtil.getEvent(event);
                var target = EventUtil.getTarget(event);
                if(target.value){
                	frames["richedit"].document.execCommand("fontsize", false, target.value);
                }
            });
            EventUtil.addHandler(cmdColor, "click", function(event){
                event = EventUtil.getEvent(event);
                var target = EventUtil.getTarget(event);
                var colorValue = target.dataset.color;
                if (colorValue){                    
                    frames["richedit"].document.execCommand("forecolor", false, colorValue);                        
                }    
            });