
	var Hilighter = function (selector)
	{
		this.selector     = selector;
		this.hilightColor = "yellow";
		this.isHilighting = true;
		this.lastHilightedText = null;

		this.hilightStack = new Array();

		$(selector).on('mouseup',  _.bind(this.doHilight, this));
	}

	Hilighter.prototype.doHilight = function(e){

		if(!this.isHilighting)
			return;

		var selection = rangy.getSelection(); 
		var range = selection.getRangeAt(0).cloneRange();
		this.lastHilightedText =  range.toString();
		this.hilightStack.push(range.toString());
		//we are highlighting inside something that has already been hilighted, so split the area into three spans. 
		//one for the each highlights and a span for the part that overlaps. Add an on hover function so that we can change the background on the 
		//middle span when we need to.
		if(selection._ranges[0].endContainer.parentNode == selection._ranges[0].startContainer.parentNode 
			&& selection._ranges[0].endContainer.parentNode.tagName == "SPAN")
		{
			this.doContainedHilight(selection, range);
		}
		else if(selection._ranges[0].startContainer.parentNode.tagName == "SPAN")
		{
			this.doRightOverlapHilight(selection, range);
		}
		else if(selection._ranges[0].endContainer.parentNode.tagName == "SPAN")
		{
			this.doLeftOverlapHilight(selection, range);
		}
		else
		{
			this.doHilightNoOverlap(selection, range);
		}
	};

	Hilighter.prototype.doContainedHilight = function(selection, range){

		var containingNode = selection._ranges[0].startContainer.parentNode;
		var newChildNode = document.createElement('SPAN');
			
		newChildNode.style.backgroundColor = this.hilightColor;
		newChildNode.setAttribute("data-color", this.hilightColor);
		newChildNode.innerHTML = selection._ranges[0].startContainer.data.substring(selection._ranges[0].startOffset, selection._ranges[0].endOffset);
		newChildNode.setAttribute('data-errorid', -1);
		
		containingNode.onmouseover = function(e){   newChildNode.style.backgroundColor = containingNode.style.backgroundColor;  };
		containingNode.onmouseout = function(e){    newChildNode.style.backgroundColor =  newChildNode.getAttribute('data-color');   };
		newChildNode.onmouseover = function(e){   e.stopPropagation(); /*eat the event...we don't need the cotaining node chaingin the color*/  };
		
		containingNode.setAttribute('data-node-position', 'containing');

		range.deleteContents();
		range.insertNode(newChildNode);
	};

	Hilighter.prototype.doRightOverlapHilight = function(selection, range){
		
		var leftSpanNode = selection._ranges[0].startContainer.parentNode;
		var middleSpanNode = document.createElement('SPAN');
		var rightSpanNode = document.createElement('SPAN');

		middleSpanNode.innerHTML = selection._ranges[0].startContainer.data.substring(selection._ranges[0].startOffset);
		rightSpanNode.innerHTML = selection._ranges[0].endContainer.data.substring(0, selection._ranges[0].endOffset);

	    middleSpanNode.style.backgroundColor = "pink";
		rightSpanNode.style.backgroundColor = this.hilightColor;
			 
		this.setUpOverlapHoverFunctions(leftSpanNode, middleSpanNode, rightSpanNode);

		rightSpanNode.setAttribute('data-errorid', -1);

		range.deleteContents();
		range.insertNode(rightSpanNode);
		range.insertNode(middleSpanNode);
	};

	Hilighter.prototype.doLeftOverlapHilight = function(selection, range){

		var leftSpanNode = document.createElement('SPAN');
		var middleSpanNode = document.createElement('SPAN');
		var rightSpanNode = selection._ranges[0].endContainer.parentNode;

		rightSpanNode.setAttribute('data-errorid', -1);

		leftSpanNode.innerHTML = selection._ranges[0].startContainer.data.substring(selection._ranges[0].startOffset);
		middleSpanNode.innerHTML = selection._ranges[0].endContainer.data.substring(0, selection._ranges[0].endOffset);
		rightSpanNode.innerHTML = selection._ranges[0].endContainer.data.substring(selection._ranges[0].endOffset);

		leftSpanNode.style.backgroundColor = this.hilightColor;
	    middleSpanNode.style.backgroundColor = "pink";
			 
		this.setUpOverlapHoverFunctions(leftSpanNode, middleSpanNode, rightSpanNode);

		range.deleteContents();
		range.insertNode(middleSpanNode);
		range.insertNode(leftSpanNode);
	};

	Hilighter.prototype.doHilightNoOverlap = function(selection, range){

		var spanNode = document.createElement('SPAN');
		spanNode.className = "rounded";
		spanNode.setAttribute("data-errorid", -1);
		spanNode.style.backgroundColor = this.hilightColor;
		spanNode.appendChild(range.extractContents());
		range.insertNode(spanNode);
	};

	Hilighter.prototype.setUpOverlapHoverFunctions = function (leftSpanNode, middleSpanNode, rightSpanNode)
	{
		
		rightSpanNode.setAttribute('data-node-position', 'right');
		leftSpanNode.setAttribute('data-node-position', 'left');
		middleSpanNode.setAttribute('data-node-position', 'middle');

		middleSpanNode.onmouseout  = function(e){ middleSpanNode.style.backgroundColor = "pink"; };
		leftSpanNode.onmouseover   = function(e){  middleSpanNode.style.backgroundColor = leftSpanNode.style.backgroundColor  };
		leftSpanNode.onmouseout    = function(e){  if(e.toElement.tagName != "SPAN") { middleSpanNode.style.backgroundColor = "pink"; }};
		rightSpanNode.onmouseover  = function(e){ middleSpanNode.style.backgroundColor = rightSpanNode.style.backgroundColor; };
		rightSpanNode.onmouseout   = function(e){  if(e.toElement.tagName != "SPAN") { middleSpanNode.style.backgroundColor = "pink"; }};
	}
