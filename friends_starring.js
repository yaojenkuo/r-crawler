var friends_starring = [
	{
		"character": "Rachel Green",
		"star": "Jennifer Aniston"
	},
	{
		"character": "Monica Geller",
		"star": "Courteney Cox"
	},
	{
		"character": "Phoebe Buffay",
		"star": "Lisa Kudrow"
	},
	{
		"character": "Joey Tribbiani",
		"star": "Matt LeBlanc"
	},
	{
		"character": "Chandler Bing",
		"star": "Matthew Perry"
	},
	{
		"character": "Ross Geller",
		"star": "David Schwimmer"
	}
];

for (var i = 0; i < friends_starring.length; i++) {
	console.log("誰飾演 " + friends_starring[i]["character"] + "：" + friends_starring[i]["star"]);
};
