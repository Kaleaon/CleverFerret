.class Lcom/flyersoft/views/MRBookView$BookViewChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "MRBookView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/MRBookView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BookViewChromeClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/MRBookView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/MRBookView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 52
    iput-object p1, p0, Lcom/flyersoft/views/MRBookView$BookViewChromeClient;->this$0:Lcom/flyersoft/views/MRBookView;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method
