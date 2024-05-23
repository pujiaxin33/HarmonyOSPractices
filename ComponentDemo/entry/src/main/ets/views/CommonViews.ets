

@Builder export function TextButton(label: ResourceStr, options?: ButtonOptions, event?: (event?: ClickEvent) => void)  {
  Button(label, options)
    .fontColor($r('app.color.text_button_font_color'))
    .backgroundColor(Color.Transparent)
    .onClick(event)
}

@Builder export function ChannelButton(label: ResourceStr, options?: ButtonOptions) {
  Button(label, options)
    .fontSize(15)
    .type(ButtonType.Circle)
    .padding(0)
}