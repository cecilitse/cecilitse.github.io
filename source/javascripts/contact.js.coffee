window.onload = ->
  mail =
    a: 'Y29udGFjdA==' # contact
    b: 'Y2VjaWxpdHNl' # cecilitse
    c: 'b3Jn'         # org

  address       = window.atob(mail.a) + '@' + window.atob(mail.b) + '.' + window.atob(mail.c)
  contactButton = document.getElementById("j-me-contact")

  if contactButton
    contactButton.setAttribute "href", "mailto:" + address
