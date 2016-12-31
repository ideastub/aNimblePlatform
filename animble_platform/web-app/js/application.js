		function prepViewOnlyArtifactStore(projectId,artifactsLabel){
			return artifactStore = dojo.store.JsonRest({
					target: serverURL + "/artifact/menu_tree/" + projectId,
					mayHaveChildren: function(object){
						return object.children;
					},
					getChildren: function(object, onComplete, onError){
						this.get(buildFetchURL(object)).then(function(fullObject){
							object.children = fullObject.children;
							onComplete(fullObject.children);
						}, function(error){
							console.error(error);
							onComplete([]);
						});
					},
					getRoot: function(onItem, onError){
						var thisDate = new Date().getTime();
						this.get("?" + thisDate + "&artifact_id=root&artifact_name=" + artifactsLabel).then(onItem, onError);
					},
					getLabel: function(object){
						return object.name;
					}

				});
		}


		function prepArtifactStore(projectId,artifactsLabel){
				return artifactStore = dojo.store.JsonRest({
					target: serverURL + "/artifact/menu_tree/" + projectId,
					mayHaveChildren: function(object){
						return object.children;
					},
					getChildren: function(object, onComplete, onError){
						this.get(buildFetchURL(object)).then(function(fullObject){
							object.children = fullObject.children;
							onComplete(fullObject.children);
						}, function(error){
							console.error(error);
							onComplete([]);
						});
					},
					getRoot: function(onItem, onError){
						var thisDate = new Date().getTime();
						this.get("?" + thisDate + "&artifact_id=root&artifact_name=" + artifactsLabel).then(onItem, onError);
					},
					getLabel: function(object){
						return object.name;
					},
					pasteItem: function(child, oldParent, newParent, bCopy, insertIndex){
						dojo.byId("ProjectLandingMessage").setAttribute("class", "dialog");
						dojo.byId("ProjectLandingMessage").innerHTML = "";
						var updateURL = serverURL + "/artifactTree/dragAndDrop?artifact_id=" + child.id + "&new_parent_id=" + newParent.id + "&artifact_relation_ref=RELATED"
						+ "&old_parent_id=" + oldParent.id + "&old_parent_tree_role="
						+ oldParent.treeRole + "&new_parent_tree_role=" + newParent.treeRole;
						
						var store = this;
						var oldChildren = oldParent.children;
						dojo.some(oldChildren, function(oldChild, i){
							if(oldChild.id == child.id){
								oldChildren.splice(i, 1);
								return true;
							}
						});
						store.put(oldParent);
						sendForm2("", "ProjectLandingMessage", updateURL);
						newParent.children.splice(insertIndex || 0, 0, child);
						store.put(newParent);
					},
					put: function(object, options){
						this.onChildrenChange(object, object.children);
						this.onChange(object);
					}
				});
			}			

	function buildFetchURL(item){
				var thisDate = new Date().getTime();
				var fetchURL = "?" + thisDate + "&tree_role=" + item.treeRole;
				var artifactType = item.type;

				if (artifactType != null) { 
					fetchURL = fetchURL + "&artifact_id=" + item.id + "artifact_name=" + item.name + "&artifactType=" + artifactType + "&currentArtifactId=";
					if (item.treeRole != 'TREE_ROOT'){
						fetchURL = fetchURL + item.id;
					} 
				}
				return fetchURL;
			}

	function fetchItemChildren(item,thisStore,treeId,fetchURL){
			lastSelected=selected[treeId]=item;					
			var pInfo = { parent: lastSelected,		attribute: "children"};
			fetchURL = fetchURL + "?treeRole=" + item.treeRole + "&artifact_id=" + item.id + "artifact_name=" + item.name;
			var type = item.type;

			if (type != null) { 
				fetchURL = fetchURL + "&artifactType=" + type + "&currentArtifactId=";
				if (item.treeRole != 'TREE_ROOT'){
					fetchURL = fetchURL + item.id;
				} 
			}
			
			var childrenValues = item.children;
			if (!childrenValues || childrenValues.length == 0){
				treeItemFetch(
					fetchURL,
					thisStore,
					lastSelected,
					pInfo
				);
			}
	}

//	function dropCreate(saveCompleteCallback,saveFailedCallback){
		//alert("neato");
//		dojo.byId("ProjectLandingMessage").innerHTML("yeah!");
//	}
	
	function dropAccept(target, source, position) {
    	var dropAcceptFlag = false;
        var isSameType = true;
        var isTreeRootMove = false;
    	
    	var destination=dijit.getEnclosingWidget(target).item;
    	var sourceNodes = source.getSelectedTreeNodes();
    	if (destination.id != "root") { 
        
	        for (var i=0;i<sourceNodes.length;i++)
	        {
	        	var start = sourceNodes[i].item;
	        	if (destination.type.toString().toUpperCase().indexOf(start.type.toString().toUpperCase()) < 0) { isSameType = false; break; }
	        	if (start.type.toString().indexOf("TREE_ROOT") >= 0) { isTreeRootMove = true; break;}
	        }

    		if (!isTreeRootMove && isSameType) { dropAcceptFlag = true; }
    	}

    	return dropAcceptFlag;
    }

    function dragAccept(source,nodes){
    	alert(source.currentWidget.item.treeRole);
    	if (source.currentWidget.item.treeRole!='TREE_ROOT') return true;
    	return false;
    }
    
    function debugObject(someObject){
		alert('someObject='+someObject);
	}

	 	//needed for tree menu
		selected=[];
		//globalId=1000;
		lastSelected=null;

		function treeItemFetch(treeItemFetchUrl, parentStore, lastSelected, pInfo){
		    //alert(treeItemFetchUrl);
   			//alert(lastSelected.name + " " + lastSelected.id);
		    //alert(pInfo);
			var treeItemStore = new dojo.data.ItemFileReadStore({ url: treeItemFetchUrl });
			//Define a callback that fires when all the items are returned.
			var gotList = function(items, request){
			  //var itemsList = "";
			  dojo.forEach(items, function(i){
				//alert(treeItemStore.getValue(i, "id"));
				//alert(treeItemStore.getValue(i, "name"));
				//alert(treeItemStore.getValue(i, "type"));
				parentStore.newItem({
     				id:treeItemStore.getValue(i, "id"),
	    			name: treeItemStore.getValue(i, "name"),
		    		type: treeItemStore.getValue(i, "type"),
		    		isRoot: treeItemStore.getValue(i, "isRoot"),
		    		parentId: treeItemStore.getValue(i, "parentId"),
		    		treeRole: treeItemStore.getValue(i, "treeRole")
				}, pInfo);
			  });
			  //alert("itemsList= " + itemsList);
			}
			var gotError = function(error, request){
			  alert("The request to the store failed. " +  error);
			}
			//Invoke the search
			treeItemStore.fetch({
			  onComplete: gotList,
			  onError: gotError
			});
		}

        function sendForm2(inboundForm, landingId, inboundURL) {
                var xhrArgs = {
                		form: inboundForm,
                        url: inboundURL,
                        handleAs: "json",
                        sync: true,
                        load: function(data) {
                    		dojo.byId(landingId).setAttribute("class", data.viewMessage.messageClass);
                    		dojo.byId(landingId).innerHTML = data.viewMessage.message;
                        }
                    }
                    var deferred = dojo.xhrPost(xhrArgs);
            }		
		
        function sendForm(inboundForm, landingId) {
            var xhrArgs = {
            		form: inboundForm,
                    url: inboundForm.action,
                    handleAs: "text",
                    sync: true,
                    load: function(data) {
                    	dojo.byId(landingId).innerHTML = data;
                    }
                }
                var deferred = dojo.xhrPost(xhrArgs);
        }

        function prepArtifactSave(inboundForm) {
        //alert('desc2='+inboundForm.elements['description2'].value);
        //alert('desc='+inboundForm.elements['description'].value);
        inboundForm.elements['description'].value=inboundForm.elements['description2'].value;
        //alert('desc='+inboundForm.elements['description'].value);
        }

		var currentBreadCrumb = 1;
		function getBreakCrumbColorClass(){
			var colorClass;
			if (currentBreadCrumb%2){
				 colorClass='breadcrumb_gray_box';
			 } else {
				 colorClass='breadcrumb_blue_box';
			 }
			 return colorClass;
		}
		
		function setBreadCrumbs(breadCrumbsText,breadCrumbsLink){
			dojo.byId("BreadCrumbs").innerHTML = "<span class='"+ getBreakCrumbColorClass() + "'><a href='/animble_platform/" + breadCrumbsLink + "'><img src='/animble_platform/images/breadcrumb.png' alt='Bread Crumb' border='0'/> " + breadCrumbsText + "</a></span>";
			currentBreadCrumb++;
		}

		function addToBreadCrumbs(breadCrumbsText,breadCrumbsLink){
			dojo.byId("BreadCrumbs").innerHTML = dojo.byId("BreadCrumbs").innerHTML + " <span class='"+ getBreakCrumbColorClass() + "'><a href='/animble_platform/" + breadCrumbsLink + "'><img src='/animble_platform/images/breadcrumb.png' alt='Bread Crumb' border='0'/> " + breadCrumbsText + "</a></span>";
			currentBreadCrumb++;
		}



	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",

		// Theme options
		theme_advanced_buttons1 : "print,|,undo,redo,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,iespell,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,link,unlink,image,cleanup,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,cite,pagebreak,|,charmap,advhr,|,fullscreen",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true



	});

    function runJasperReport(format,reportLanguage,fileName,queryName,formObject) {

      var addl_params = "";
		for(i=0; i<formObject.elements.length; i++)
		{
			var elementName = formObject.elements[i].name;
			var elementValue = formObject.elements[i].value;
			if (elementName != ""){
				addl_params += "&" + elementName + "=" + elementValue
			}
		}
      
      	if (reportLanguage=='SQL'){
    	  	document.getElementById("reportFrame").src = "/animble_platform/jasper/?_name=&_format=" + format + "&_file="+ fileName + addl_params;
      	} else {
	      	document.getElementById("reportFrame").src = "/animble_platform/reportQuery/" + queryName + "/?_name=&_format=" + format + "&_file="+ fileName + addl_params;
      	}
      //document.getElementById("reportFrame").src = 'http://www.google.com';
      //return false;
    }

	function selectButton(buttonId) {
		document.getElementById(buttonId).className='buttonSelected';
	}

		function unselectButton(buttonId) {
		document.getElementById(buttonId).className='buttonNotSelected';
	}

	function selectMenuButton(buttonId) {
		document.getElementById(buttonId).className='menubuttonSelected';
	}

	function unselectMenuButton(buttonId) {
		document.getElementById(buttonId).className='menubuttonNotSelected';
	}

	function selectSearchButton(buttonId) {
		document.getElementById(buttonId).className='searchbuttonSelected';
	}

	function unselectSearchButton(buttonId) {
		document.getElementById(buttonId).className='searchbuttonNotSelected';
	}










var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}


// ----------------------------------------------------------------------
// Detect DOM capabilities and set global DOM variables
// ----------------------------------------------------------------------

var isNS4 = false;
var isIE4 = false;
var isW3C = false;
	

if (document.all) {						//Internet Explorer
	isIE4 = true;
	docObj = "document.all.";
	docObjTail = "";
	styleObj = ".style";
	heightObj = ".clientHeight";
	widthObj = ".clientWidth";
	topObj = ".pixelTop";	
}	
else if (document.layers) {				//Netscape Navigator 4.x
	isNS4 = true;
	docObj = "document.";
	docObjTail = "";
	styleObj = "";
	heightObj = ".clip.height";
	widthObj = ".clip.width";
	topObj = ".top";	
}
else /*(document.getElementByID)*/ {		//Netscape Navigator 6, W3C Compliant
	isW3C = true;
	docObj = "document.getElementById('";
	docObjTail = "')";
	styleObj = "').style"; 
	heightObj = ".offsetHeight";
	widthObj = ".offsetWidth";
	topObj = ".top";
}


function toggleDivs(showDiv, e) {
	  x = (window.Event) ? e.pageX : event.clientX;
	  y =  mouseY(e);

	//var bag           = /[0-9]/g;
	//alert("clickedon: " + clickedon);
	//var newclickedon  = clickedon.replace(bag,'');
	//alert("newclickedon: " + newclickedon);
	dom = eval(docObj + showDiv + styleObj);

	
	var iWidth = eval(docObj + showDiv + docObjTail + widthObj);
	var iHeight = eval(docObj + showDiv + docObjTail + heightObj);
		
    dom.left    = (x + 30) + "px";
    dom.top     = (y - 30) + "px";
	
	dom.visibility = "visible";
}

function toggleDivsOff(hideDiv) {
	dom         = eval(docObj + hideDiv + styleObj);
	dom.visibility = "hidden";
}


function checkPosition(div, e) {
    var myX = mouseX(e);
    var myY = mouseY(e);

	alert("Y: " + myY + " X: " + myX);
	return true;
}


function mouseX(evt) {
if (evt.pageX) return evt.pageX;
else if (evt.clientX)
   return evt.clientX + (document.documentElement.scrollLeft ?
   document.documentElement.scrollLeft :
   document.body.scrollLeft);
else return null;
}

function mouseY(evt) {
if (evt.pageY) return evt.pageY;
else if (evt.clientY)
   return evt.clientY + (document.documentElement.scrollTop ?
   document.documentElement.scrollTop :
   document.body.scrollTop);
else return null;
}

  function showHideRow(row)
  {
    obj = document.getElementById(row);
    if(obj.style.display == "none")
    {
        obj.style.display = "";
    }
    else
    {
        obj.style.display = "none";
    }
  }

  function showModal(objectId, targetHref)
  {
	  dijit.byId(objectId).domNode.style.height="100%";
	  dijit.byId(objectId).domNode.style.width="100%";
	  dijit.byId(objectId).domNode.style.zIndex=10;
	  dijit.byId(objectId).setHref(targetHref);

  }

  function hideModal(objectId)
  {
	  dijit.byId(objectId).domNode.style.height="0%";
	  dijit.byId(objectId).domNode.style.width="0%";
	  dijit.byId(objectId).domNode.style.zIndex=-1;
	  dojo.byId(objectId).innerHTML = "";

  }
  
window.addEvent('domready', function(){

	$$('input.DatePicker').each( function(el){
		new DatePicker(el);
	});

});  