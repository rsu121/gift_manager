# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create email: "alice@example.com", password: "123456"

person_ryo = Person.new
person_ryo.name = "Ryo"
person_ryo.phonenumber = "0-000-000-0000"
person_ryo.address = "Isogo, Yokohama, Japan"
person_ryo.birthday = "1982-05-01"
person_ryo.image_url = "https://cdn2.iconfinder.com/data/icons/people-diversity-portraits-and-human-faces/32/i32-01-512.png"
person_ryo.user_id = user.id
person_ryo.save

person_mom = Person.new
person_mom.name = "Mom"
person_mom.phonenumber = "1-111-111-1111"
person_mom.address = "Bessho, Tokyo, Japan"
person_mom.birthday = "1954-09-01"
person_mom.image_url = "https://cdn4.iconfinder.com/data/icons/bussines-people/288/avatar-woman-glasses-512.png"
person_mom.user_id = user.id
person_mom.save

person_dad = Person.new
person_dad.name = "Dad"
person_dad.phonenumber = "2-222-222-2222"
person_dad.address = "Bessho, Tokyo, Japan"
person_dad.birthday = "1952-05-01"
person_dad.image_url = "https://cdn2.iconfinder.com/data/icons/happy-users/100/users12-512.png"
person_dad.user_id = user.id
person_dad.save

received_gift_iphone = ReceivedGift.new
received_gift_iphone.content = "iPhone6"
received_gift_iphone.purpose = "Gift to celebrate my entrance to Kellogg."
received_gift_iphone.date = "2015-06-01"
received_gift_iphone.image_url = "http://store.storeimages.cdn-apple.com/4973/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone6/select/iphone6-select-2014_GEO_US?wid=1200&hei=630&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=jBykt3"
received_gift_iphone.user_id = user.id
received_gift_iphone.save

received_gift_kindle = ReceivedGift.new
received_gift_kindle.content = "Kindle Fire"
received_gift_kindle.purpose = "My birthday present."
received_gift_kindle.date = "2015-08-05"
received_gift_kindle.image_url = "http://ecx.images-amazon.com/images/I/611RRQfqAJL._SY355_.jpg"
received_gift_kindle.user_id = user.id
received_gift_kindle.save

received_gift_vaio = ReceivedGift.new
received_gift_vaio.content = "Vaio AW"
received_gift_vaio.purpose = "Gift from my brother when he visited me in SF."
received_gift_vaio.date = "2016-06-06"
received_gift_vaio.image_url = "http://www.notebookcheck.net/uploads/tx_nbc2/awseries_01.jpg"
received_gift_vaio.user_id = user.id
received_gift_vaio.save

sender = Sender.new
sender.received_gift_id = received_gift_iphone.id
sender.person_id = person_dad.id
sender.user_id = user.id
sender.save

sender = Sender.new
sender.received_gift_id = received_gift_iphone.id
sender.person_id = person_mom.id
sender.user_id = user.id
sender.save

sender = Sender.new
sender.received_gift_id = received_gift_kindle.id
sender.person_id = person_dad.id
sender.user_id = user.id
sender.save

sender = Sender.new
sender.received_gift_id = received_gift_kindle.id
sender.person_id = person_mom.id
sender.user_id = user.id
sender.save

sender = Sender.new
sender.received_gift_id = received_gift_vaio.id
sender.person_id = person_ryo.id
sender.user_id = user.id
sender.save

sent_gift_flower = SentGift.new
sent_gift_flower.content = "Flowers"
sent_gift_flower.purpose = "Mother's day's gift."
sent_gift_flower.date = "2015-05-05"
sent_gift_flower.image_url = "https://s-media-cache-ak0.pinimg.com/736x/94/3b/fc/943bfcfc2a7213b9cdc1b52ed7d64218.jpg"
sent_gift_flower.user_id = user.id
sent_gift_flower.save

sent_gift_beer = SentGift.new
sent_gift_beer.content = "Beer"
sent_gift_beer.purpose = "Gift for my parent's wedding anniversary."
sent_gift_beer.date = "2016-06-05"
sent_gift_beer.image_url = "http://www.secomfoods.com/goods/SyokuSyohnImg/060364b_image.jpg"
sent_gift_beer.user_id = user.id
sent_gift_beer.save

sent_gift_giftcard = SentGift.new
sent_gift_giftcard.content = "Amazon gift card"
sent_gift_giftcard.purpose = "Gift to my brother when he visited me in SF."
sent_gift_giftcard.date = "2016-06-05"
sent_gift_giftcard.image_url = "https://www.google.com/search?q=amazon+gift+card&client=safari&rls=en&source=lnms&tbm=isch&sa=X&ved=0ahUKEwic5s6MjpTNAhUPU1IKHeaCAVMQ_AUICCgC&biw=1237&bih=653#imgrc=_HqGVHOvmsmSSM%3A"
sent_gift_giftcard.user_id = user.id
sent_gift_giftcard.save

recipient = Recipient.new
recipient.sent_gift_id = sent_gift_flower.id
recipient.person_id = person_mom.id
recipient.user_id = user.id
recipient.save

recipient = Recipient.new
recipient.sent_gift_id = sent_gift_beer.id
recipient.person_id = person_dad.id
recipient.user_id = user.id
recipient.save

recipient = Recipient.new
recipient.sent_gift_id = sent_gift_beer.id
recipient.person_id = person_mom.id
recipient.user_id = user.id
recipient.save

recipient = Recipient.new
recipient.sent_gift_id = sent_gift_giftcard.id
recipient.person_id = person_ryo.id
recipient.user_id = user.id
recipient.save
