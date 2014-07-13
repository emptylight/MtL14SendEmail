if Meteor.isClient
	Template.sendEmailForm.events
		'click #send': (e,t) ->
			to = $ "#to"
			subject = $ "#subject"
			content = $ "#content"
			Meteor.apply "sendEmail", [to.val(), subject.val(), content.val()]
###
			to = t.find "#to"
			subject = t.find "#subject"
			content = t.find "#content"
			Meteor.apply "sendEmail", [to.value, subject.value, content.value]
###

if Meteor.isServer
	Meteor.methods
		sendEmail: (to, subject, content)->
			console.log this
			Email.send 
				from: "admin@localhost.com"
				to:to
				subject:subject
				text:content

# to send a email use:
# MAIL_URL="smtp://account:pass.account@smtp.gmail.com:587" meteor
