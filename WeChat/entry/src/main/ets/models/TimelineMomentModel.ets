import { TimelineMomentCommentEntity, TimelineMomentEntity, TimelineMomentImageEntity, TimelineMomentSenderEntity } from '../repositories/Entities/TimelineMomentEntity'


export class TimelineMomentModel {
  content: string
  images: TimelineMomentImageModel[] = []
  sender: TimelineMomentSenderModel
  comments: TimelineMomentCommentModel[] = []

  hasImages: boolean = false
  imagesColumnsTemplate: string
  imagesRowsTemplate: string

  hasComments: boolean = false
  photosHeight: Length
  photosWidth: Length

  constructor(entity: TimelineMomentEntity) {
    this.content = entity.content
    if (entity.images && entity.images.length > 0) {
      this.hasImages = true
      this.images = entity.images.map(item => {
        return new TimelineMomentImageModel(item)
      })

      if (this.images.length == 1) {
        this.photosWidth = '50%'
        this.photosHeight = 100
        this.imagesColumnsTemplate = "1fr"
        this.imagesRowsTemplate = "1fr"
      } else {
        this.photosWidth = '100%'
        let rowsNumber = this.images.length % 3 + (this.images.length / 3 ? 1 : 0)
        this.photosHeight = rowsNumber * ( 100 + 10 )
        this.imagesColumnsTemplate = "1fr 1fr 1fr"
        var imagesRowsTemplate: string = ""
        for (let index = 0; index < rowsNumber; index++) {
          imagesRowsTemplate = imagesRowsTemplate.concat("1fr ")
        }
        this.imagesRowsTemplate = imagesRowsTemplate
      }
    }
    this.sender = new TimelineMomentSenderModel(entity.sender)
    if (entity.comments && entity.comments.length > 0) {
      this.hasComments = true
      this.comments = entity.comments.map(item => {
        return new TimelineMomentCommentModel(item)
      })
    }
  }
}

export class TimelineMomentImageModel {
  url: string

  constructor(entity: TimelineMomentImageEntity) {
    this.url = entity.url
  }
}

export class TimelineMomentSenderModel {
  username: string
  nick: string
  avatar: string

  constructor(entity: TimelineMomentSenderEntity) {
    this.username = entity.username
    this.nick = entity.nick
    this.avatar = entity.avatar
  }
}

export class TimelineMomentCommentModel {
  content: string
  sender: TimelineMomentSenderModel
  uuid: string

  constructor(entity: TimelineMomentCommentEntity) {
    this.content = entity.content
    this.sender = new TimelineMomentSenderModel(entity.sender)
  }
}