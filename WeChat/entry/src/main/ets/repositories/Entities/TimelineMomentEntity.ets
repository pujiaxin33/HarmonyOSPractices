
export class TimelineMomentEntity {
  content: string
  images: TimelineMomentImageEntity[]
  sender: TimelineMomentSenderEntity
  comments: TimelineMomentCommentEntity[]
}

export class TimelineMomentImageEntity {
  url: string
}

export class TimelineMomentSenderEntity {
  username: string
  nick: string
  avatar: string
}

export class TimelineMomentCommentEntity {
  content: string
  sender: TimelineMomentSenderEntity
}
