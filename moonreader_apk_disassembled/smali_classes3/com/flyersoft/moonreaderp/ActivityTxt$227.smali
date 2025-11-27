.class Lcom/flyersoft/moonreaderp/ActivityTxt$227;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initMp3Lay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 21014
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 21016
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3PlayState:I

    const/4 v0, 0x2

    if-nez p1, :cond_0

    .line 21017
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mmp3StartButton(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_0

    .line 21018
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3PlayState:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 21019
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->pause()V

    .line 21020
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3PlayState:I

    goto :goto_0

    .line 21022
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 21023
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput v1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3PlayState:I

    .line 21025
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3Play:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$227;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3PlayState:I

    if-eq v1, v0, :cond_2

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->tts_pause:I

    goto :goto_1

    :cond_2
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->tts_play:I

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
