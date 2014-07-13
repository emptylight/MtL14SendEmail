if Meteor.isClient
	Template.sendEmailForm.events

		'click button': (e,t) ->
			致 = t.find "致"
			主题 = t.find "主题"
			内容 = t.find "内容"
			Meteor.apply "sendEmail", [致, 主题, 内容]

if Meteor.isServer
	Meteor.methods
		sendEmail: (致, 主题	, 内容)->
			Email.send 
				from: "admin@localhost.com"
				to:致
				subject:主题
				text:内容
