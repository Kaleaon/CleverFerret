.class Lcom/flyersoft/moonreaderp/ActivityTxt$137;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initMediaSession()V
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

    .line 13920
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$137;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onMediaButtonEvent(Landroid/content/Intent;)Z
    .locals 1

    .line 13923
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$137;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/components/OpenFile_Receiver;->handleMediaIntent(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method
