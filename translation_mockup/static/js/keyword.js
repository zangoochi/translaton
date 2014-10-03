
document.getElementById('keywordButton').onclick = function()
{
	if($("keywordSearch").val() != "")
	{

		$.ajax
		({
			type: "GET",
			url: "keywords/"+  $("#keywordSearch").val()   +"/",
			dataType: "JSON",
			success: function(data)
			{
				keywordList.reset();
				$("#keywordTable").html('');
				$.each(data, function(index, value){
					newKeywordResult = new KeywordResult({});
					newKeywordResult.set('hilightedResult', value['hilightedResult']);
					newKeywordResult.set('documentType', value['documentType']);
					newKeywordResult.set('pk', value['pk']);
					keywordList.add(newKeywordResult);
				});
			
				keywordResultsView.renderSubset(0, 9);
			}
		});
	}	 
}

//models 
var KeywordResult = Backbone.Model.extend({});

var KeywordResultList = Backbone.Collection.extend({
	model : KeywordResult
});

//VIEWS
//the individual table row view
var KeywordResultView = Backbone.View.extend({
	
	tagName: 'tr',
	template: "<td>...<%= model.get('hilightedResult') %>...</td><td><%= model.get('documentType') %></td><td>#<%= model.get('pk') %></td>",

	render: function(){
		$(this.el).html(_.template(this.template, {model: this.model}));
		return this;
	}

});

//the view for ALL of the keyword results (the table and the pagination at the bottom)
var KeywordResultsView = Backbone.View.extend({

	el: $("#keywordTable"),

	renderSubset: function(startIndex, stopIndex){
		$('#keywordTable').html('');

		var subset = this.collection.models.slice(startIndex, stopIndex);
		$.each(subset , function(index, model){
			newKeywordView = new KeywordResultView({model: model})
			$('#keywordTable').append(newKeywordView.render().el);
		});
	}
});

//the view for the pagination
var PaginationView = Backbone.View.extend({

	el: $(".pagination"),
	template: '<li class= <%= classStr %> ><a href="#"><%= number %></a></li>',

	events: {
		'click li': 'onPaginationClick'
	},
	initialize: function(options){
		this.collection.bind('add', _.bind(this.render, this));
		this.tableView = options.tableView;
		this.numToDisplay = options.numToDisplay;
		this.currentPage = 1;
	},
	render: function(model){
		
		$(this.el).html('');
		numPagesToRender = parseInt(this.collection.length / 10);
		for(var i = 0; i < numPagesToRender; i++)
		{
			var classStr = "";
			if(i + 1 == this.currentPage){ classStr = "current" }
			$(this.el).append(_.template(this.template, {number : (i + 1), classStr : classStr }));
		}
	},
	onPaginationClick: function(e){
		pageClicked = parseInt(e.currentTarget.innerText);
		this.tableView.renderSubset((pageClicked -1) * this.numToDisplay , ((pageClicked -1) * this.numToDisplay) + this.numToDisplay - 1);
		this.currentPage = pageClicked;
		this.render();
	}
});

var keywordList = new KeywordResultList();
var keywordResultsView = new KeywordResultsView({collection : keywordList});
var paginationView = new PaginationView({collection : keywordList, tableView: keywordResultsView, numToDisplay : 10});
